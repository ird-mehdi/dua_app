import 'package:dua/core/config/app_images.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/di/service_locator.dart';
import 'package:dua/presentation/bookmark/presenter/bookmark_presenter.dart';
import 'package:dua/presentation/common/widgets/custom_app_bar.dart';
import 'package:dua/presentation/common/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    locate<BookmarkPresenter>();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(eightPx),
        child: Column(
          children: [
            CustomAppBar(
              title: 'Bookmark',
              icon: AppImages.icBookmark,
              titleSpacing: eightPx,
              titleFontSize: eighteenPx,
            ),
            CustomSearchBar(
              hintText: 'Search bookmarked duas',
            ),
            Expanded(
              child: GetBuilder<BookmarkPresenter>(
                builder: (controller) {
                  if (controller.currentUiState.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (controller.currentUiState.bookmarkedDuas.isEmpty) {
                    return const Center(
                      child: Text('No bookmarked duas found'),
                    );
                  }

                  return ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return BookmarkItem(
                        color: theme.colorScheme.primaryContainer,
                        iconColor: theme.colorScheme.primary,
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
}

class BookmarkItem extends StatelessWidget {
  final Color color;
  final Color iconColor;
  final VoidCallback? onPressed;

  const BookmarkItem({
    super.key,
    required this.color,
    required this.iconColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFF3F4F6), // border-gray-100
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
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
                children: const [
                  Text(
                    'Bookmark Name',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1F2937), // text-gray-800
                    ),
                  ),
                  Text(
                    'Total 12 Duas',
                    style: TextStyle(
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
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) => const OptionsBottomSheet(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class OptionsBottomSheet extends StatelessWidget {
  const OptionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final BookmarkPresenter presenter = locate<BookmarkPresenter>();
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
                folderName: 'Bookmark Name',
                folderColor: Theme.of(context).colorScheme.primary,
              );
            },
          ),
          const SizedBox(height: 8),
          OptionItem(
            icon: Icons.delete,
            title: 'Delete',
            onTap: () {
              Navigator.pop(context);
              // Handle delete action
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
