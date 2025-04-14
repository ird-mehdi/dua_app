import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/di/service_locator.dart';
import 'package:dua/core/static/svg_path.dart';
import 'package:dua/core/static/ui_const.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/domain/entities/dua_entity.dart';
import 'package:dua/presentation/bookmark/presenter/bookmark_presenter.dart';
import 'package:dua/presentation/bookmark/presenter/bookmark_ui_state.dart';
import 'package:dua/presentation/bookmark/ui/bookmark_folder_detail_page.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:dua/presentation/common/widgets/custom_search_bar.dart';
import 'package:dua/presentation/common/widgets/svg_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  final BookmarkPresenter presenter = locate<BookmarkPresenter>();

  @override
  void initState() {
    super.initState();
    presenter.loadBookmarkFolders();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Reset current folder name when returning to this screen
    if (presenter.currentUiState.currentFolderName.isNotEmpty) {
      presenter.resetCurrentFolder();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Bookmark',
        icon: AppImages.icCategory2,
        titleSpacing: eightPx,
        titleFontSize: eighteenPx,
        actions: [
          Padding(
            padding: EdgeInsets.all(tenPx),
            child: Row(
              children: [
                SvgImage(
                  assetName: SvgPath.icFolderFavorate,
                ),
                gapW20,
                SvgImage(
                  assetName: SvgPath.icLogin,
                ),
              ],
            ),
          ),
        ],
        onLeadingPressed: () {
          presenter.loadBookmarkFolders();
        },
      ),
      body: AnimatedBuilder(
        animation: presenter,
        builder: (context, child) {
          return presenter.currentUiState.isLoading
              ? const Center(child: CircularProgressIndicator())
              : _buildContent();
        },
      ),
    );
  }

  Widget _buildContent() {
    Theme.of(context);

    return Padding(
      padding: EdgeInsets.all(eightPx),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomSearchBar(
                  hintText: 'Search bookmarked duas',
                  controller: presenter.searchController,
                  onChanged: (query) {
                    // The controller listener will handle this
                  },
                ),
              ),
              SizedBox(width: 8),
              _buildSortButton(),
            ],
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
            color: Colors.grey.withOpacityInt(0.5),
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
              color: Colors.grey.withOpacityInt(0.5),
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
            color: Theme.of(context).primaryColor.withOpacityInt(0.05),
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

  // Add the sort button widget
  Widget _buildSortButton() {
    return PopupMenuButton<BookmarkSortOption>(
      icon: Icon(
        Icons.sort,
        color: Theme.of(context).primaryColor,
      ),
      tooltip: 'Sort',
      onSelected: (BookmarkSortOption option) {
        presenter.setSortOption(option);
      },
      itemBuilder: (BuildContext context) =>
          <PopupMenuEntry<BookmarkSortOption>>[
        PopupMenuItem<BookmarkSortOption>(
          value: BookmarkSortOption.recent,
          child: Row(
            children: [
              Icon(
                Icons.access_time,
                color: presenter.currentUiState.sortOption ==
                        BookmarkSortOption.recent
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
                size: 18,
              ),
              SizedBox(width: 8),
              Text(
                'Recent',
                style: TextStyle(
                  color: presenter.currentUiState.sortOption ==
                          BookmarkSortOption.recent
                      ? Theme.of(context).primaryColor
                      : null,
                  fontWeight: presenter.currentUiState.sortOption ==
                          BookmarkSortOption.recent
                      ? FontWeight.bold
                      : null,
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem<BookmarkSortOption>(
          value: BookmarkSortOption.alphabetical,
          child: Row(
            children: [
              Icon(
                Icons.sort_by_alpha,
                color: presenter.currentUiState.sortOption ==
                        BookmarkSortOption.alphabetical
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
                size: 18,
              ),
              SizedBox(width: 8),
              Text(
                'A-Z',
                style: TextStyle(
                  color: presenter.currentUiState.sortOption ==
                          BookmarkSortOption.alphabetical
                      ? Theme.of(context).primaryColor
                      : null,
                  fontWeight: presenter.currentUiState.sortOption ==
                          BookmarkSortOption.alphabetical
                      ? FontWeight.bold
                      : null,
                ),
              ),
            ],
          ),
        ),
      ],
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
