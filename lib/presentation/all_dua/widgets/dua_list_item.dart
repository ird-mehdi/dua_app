import 'package:dua/domain/entities/dua_entity.dart';
import 'package:dua/presentation/all_dua/presenter/all_dua_presenter.dart';
import 'package:dua/presentation/dua_details/ui/dua_details_page.dart';
import 'package:flutter/material.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/external_libs/scrollable_positioned_list/scrollable_positioned_list.dart';

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

    if (groupedData.isEmpty && !presenter.currentUiState.isLoading) {
      return const Center(child: Text('No duas to display.'));
    }
    if (groupedData.isEmpty && presenter.currentUiState.isLoading) {
      return const SizedBox.shrink(); // Or a small indicator
    }

    return ScrollablePositionedList.builder(
      itemScrollController:
          presenter.itemScrollController, // Use controller from presenter
      itemPositionsListener:
          presenter.itemPositionsListener, // Use listener from presenter
      itemCount: groupedData.length,
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
      child: InkWell(
        onTap: () {
          // Navigate to Dua Details Page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DuaDetailsPage(dua: dua),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: sixteenPx, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  dua.name,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: context.color.titleColor, // Use theme title color
                    fontSize: fourteenPx, // Adjust font size if needed
                  ),
                  overflow: TextOverflow.ellipsis, // Handle long text
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
