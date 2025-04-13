import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/di/service_locator.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/domain/entities/dua_entity.dart';
import 'package:dua/presentation/bookmark/presenter/bookmark_presenter.dart';
import 'package:dua/presentation/bookmark/ui/bookmark_folder_detail_page.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:dua/presentation/common/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Theme.of(context);
    final presenter = locate<BookmarkPresenter>();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(eightPx),
        child: Column(
          children: [
            CustomAppBar(
              paddingLeft: 0,
              title: 'Bookmark',
              icon: AppImages.icCategory2,
              titleSpacing: eightPx,
              titleFontSize: eighteenPx,
              onLeadingPressed:
                  presenter.currentUiState.currentFolderName.isNotEmpty
                      ? () {
                          // Go back to folder list
                          presenter.loadBookmarkFolders();
                        }
                      : null,
            ),
            CustomSearchBar(
              hintText: 'Search bookmarked duas',
            ),
            const SizedBox(height: 10), // 10px gap after search bar
            Expanded(
              child: GetBuilder<BookmarkPresenter>(
                builder: (controller) {
                  if (controller.currentUiState.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // Display folder content if a folder is selected
                  if (controller.currentUiState.currentFolderName.isNotEmpty) {
                    return _buildFolderContent(context, controller);
                  }

                  // Display folder list
                  if (controller.currentUiState.bookmarkFolders.isEmpty) {
                    return _buildEmptyState();
                  }

                  return ListView.separated(
                    itemCount: controller.currentUiState.bookmarkFolders.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10), // 10px gap between items
                    itemBuilder: (context, index) {
                      final folder =
                          controller.currentUiState.bookmarkFolders[index];
                      return BookmarkItem(
                        folderName: folder.name,
                        duaCount: folder.duaCount,
                        color: folder.color.withOpacityInt(20),
                        iconColor: folder.color,
                        folderIndex: index,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookmarkFolderDetailPage(
                                folder: folder,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.bookmark_outline,
            size: 64,
            color: Colors.grey.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          const Text(
            'No bookmarked folders yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Bookmark your favorite duas by clicking the\nbookmark icon in a dua detail page',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFolderContent(
      BuildContext context, BookmarkPresenter controller) {
    final folderName = controller.currentUiState.currentFolderName;
    final bookmarkedDuas = controller.currentUiState.bookmarkedDuas;

    if (bookmarkedDuas.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.folder_open,
              size: 64,
              color: Colors.grey.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'No duas in $folderName',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: bookmarkedDuas.length,
      itemBuilder: (context, index) {
        final dua = bookmarkedDuas[index];
        return _buildDuaItem(context, dua, controller);
      },
    );
  }

  Widget _buildDuaItem(
      BuildContext context, DuaEntity dua, BookmarkPresenter controller) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          dua.name,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          dua.context.isEmpty ? 'Dua #${dua.id}' : dua.context,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '${dua.id}',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        onTap: () {
          controller.navigateToDuaDetails(context, dua);
        },
      ),
    );
  }
}

class BookmarkItem extends StatelessWidget {
  final String folderName;
  final int duaCount;
  final Color color;
  final Color iconColor;
  final int folderIndex;
  final VoidCallback? onPressed;
  final VoidCallback? onTap;

  const BookmarkItem({
    super.key,
    required this.folderName,
    required this.duaCount,
    required this.color,
    required this.iconColor,
    required this.folderIndex,
    this.onPressed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFFF3F4F6), // border-gray-100
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacityInt(0.05),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.folder,
                    size: 20,
                    color: iconColor,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      folderName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1F2937), // text-gray-800
                      ),
                    ),
                    Text(
                      'Total $duaCount Duas',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF4B5563), // text-gray-600
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.grey,
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) =>
                      OptionsBottomSheet(folderIndex: folderIndex),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OptionsBottomSheet extends StatelessWidget {
  final int folderIndex;

  const OptionsBottomSheet({
    super.key,
    required this.folderIndex,
  });

  @override
  Widget build(BuildContext context) {
    final BookmarkPresenter presenter = locate<BookmarkPresenter>();
    final folder = presenter.currentUiState.bookmarkFolders[folderIndex];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OptionItem(
            icon: Icons.edit,
            title: 'Edit Bookmark',
            onTap: () {
              Navigator.pop(context);
              presenter.showEditBookmarkBottomSheet(
                context,
                folderName: folder.name,
                folderColor: folder.color,
                folderIndex: folderIndex,
              );
            },
          ),
          const SizedBox(height: 8),
          OptionItem(
            icon: Icons.delete,
            title: 'Delete',
            onTap: () {
              Navigator.pop(context);
              presenter.deleteFolder(context, folder);
            },
          ),
        ],
      ),
    );
  }
}

class OptionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const OptionItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
