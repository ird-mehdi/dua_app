import 'package:dua/domain/entities/dua_entity.dart';
import 'package:dua/presentation/all_dua/presenter/all_dua_presenter.dart';
import 'package:dua/presentation/dua_details/ui/dua_details_page.dart';
import 'package:flutter/material.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/core/config/dua_screen.dart';
// Import scrollable_positioned_list
import 'package:dua/core/external_libs/scrollable_positioned_list/scrollable_positioned_list.dart';

// Constants used for consistent sizing

// Renamed widget to reflect it holds the list logic now
class DuaListItem extends StatelessWidget {
  final AllDuasPresenter presenter;
  final ThemeData theme;

  const DuaListItem({
    required this.presenter,
    required this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get the grouped data from the presenter
    final groupedData = presenter.groupedListSections;

    // If groupedData is still being processed or empty, show appropriate widget
    // Note: The Page already handles the main loading/empty states.
    // This check is mostly for safety.
    if (groupedData.isEmpty && !presenter.currentUiState.isLoading) {
      // This case should ideally be handled by the page, but included as a fallback.
      // Consider logging an error here if it's reached unexpectedly.
      return const Center(child: Text('No duas to display.'));
    }
    if (groupedData.isEmpty && presenter.currentUiState.isLoading) {
      // Can show a minimal inline loader if needed, but page handles main one.
      return const SizedBox.shrink(); // Or a small indicator
    }

    // Use ScrollablePositionedList for optimized scrolling and jumping
    return ScrollablePositionedList.builder(
      itemScrollController:
          presenter.itemScrollController, // Use controller from presenter
      itemPositionsListener:
          presenter.itemPositionsListener, // Use listener from presenter
      itemCount: groupedData.length,
      // Consider adjusting cacheExtent based on item size and performance testing
      // cacheExtent: 500, // Keep or adjust based on testing
      itemBuilder: (context, index) {
        final section = groupedData[index];

        if (section.isHeader) {
          // Render section header
          return _buildSectionHeader(context, section.letter);
        } else {
          // Render dua item
          // Ensure dua is not null (shouldn't happen if logic is correct)
          if (section.dua != null) {
            return _buildDuaItem(context, section.dua!);
          } else {
            // Fallback for safety, should not be reached
            return const SizedBox.shrink();
          }
        }
      },
    );
  }

  // --- Helper methods for building list items ---

  // Removed: _computeGroupedData (Now handled in the presenter)

  Widget _buildSectionHeader(BuildContext context, String letter) {
    // Keep fixed header height for position calculation consistency if needed,
    // or allow dynamic height if calculations adapt. Let's keep it fixed for now.
    return Container(
      height: 50, // Fixed header height (matches presenter calculation if any)
      padding: EdgeInsets.symmetric(horizontal: sixteenPx),
      // Use a slightly different background for headers
      color: context.color.shadeColor
          .withOpacityInt(0.15), // Example: subtle background
      alignment: Alignment.centerLeft,
      child: CircleAvatar(
        backgroundColor: context.color.primaryColor100, // Use theme primary
        child: Text(
          letter,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white, // White text on primary color circle
          ),
        ),
      ),
    );
  }

  Widget _buildDuaItem(BuildContext context, DuaEntity dua) {
    // Keep fixed item height for position calculation consistency if needed.
    // Let's keep it fixed for now.
    return SizedBox(
      height: 60, // Fixed item height (matches presenter calculation if any)
      child: ListTile(
        // Add some horizontal padding
        contentPadding:
            EdgeInsets.symmetric(horizontal: sixteenPx, vertical: 0),
        // Potentially add leading number or icon if design requires
        // leading: CircleAvatar(child: Text(dua.id.toString()), radius: 15), // Example
        title: Text(
          dua.name,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: context.color.titleColor, // Use theme title color
            fontSize: fourteenPx, // Adjust font size if needed
          ),
          overflow: TextOverflow.ellipsis, // Handle long text
          maxLines: 1,
        ),
        onTap: () {
          // Navigate to Dua Details Page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DuaDetailsPage(dua: dua),
            ),
          );
        },
        // Add a subtle visual separator if desired
        // dense: true, // Make ListTile slightly more compact
        // visualDensity: VisualDensity.compact,
      ),
    );
  }
}

// Removed: _ListSection class (moved to presenter or a shared location)
// Removed: OptimizedDuaList class (logic integrated into DuaListItem)
