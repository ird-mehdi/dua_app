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
                    itemCount: controller.currentUiState.bookmarkedDuas.length,
                    itemBuilder: (context, index) {
                      final dua =
                          controller.currentUiState.bookmarkedDuas[index];
                      return ListTile(
                        title: Text(
                          dua,
                          style: theme.textTheme.titleMedium,
                        ),
                        leading: Text(
                          '${index + 1}',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
