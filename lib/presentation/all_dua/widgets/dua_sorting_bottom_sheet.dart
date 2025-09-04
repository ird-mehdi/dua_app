import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:flutter/material.dart';

// No functional changes required based on the ref file analysis for this widget.
// It remains a simple UI component. Future enhancements could involve
// connecting the radio buttons to presenter state/logic if sorting is implemented.

class DuaSortingBottomSheet extends StatelessWidget {
  const DuaSortingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final String? currentSortGroup = null; // Placeholder for state management

    return Container(
      // Added padding for content inside the sheet
      padding: EdgeInsets.symmetric(vertical: twelvePx, horizontal: eightPx),
      decoration: BoxDecoration(
          color: context.color.backgroundColor, // Use theme background
          // Consider using shape property for rounded corners
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0), // Adjust radius as needed
            topRight: Radius.circular(20.0),
          ),
          // Optional: Add shadow
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            )
          ]),
      // Use Column with MainAxisSize.min to fit content height
      child: Column(
        mainAxisSize: MainAxisSize.min, // Important for bottom sheets
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add a grab handle indicator
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: EdgeInsets.only(bottom: tenPx),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          // Title for the section
          Padding(
            padding:
                EdgeInsets.only(left: sixteenPx, top: eightPx, bottom: eightPx),
            child: Text(
              'Sort Duas By', // Changed title slightly
              style: theme.textTheme.titleLarge?.copyWith(
                // Use a slightly larger title style
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Sorting options
          RadioListTile<String>(
            // Specify type argument
            title: Text(
              'Default Order', // Example: 'by Number' or 'Default'
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: fifteenPx,
                color: context.color.titleColor,
                // fontWeight: FontWeight.w500, // Keep if desired
              ),
            ),
            value: 'default', // Assign unique value
            groupValue: currentSortGroup, // Connect to state
            onChanged: (value) {
              // TODO: Call presenter method to update sorting
              // presenter.setSortOrder('default');
              Navigator.pop(context); // Close bottom sheet on selection
            },
            activeColor: context.color.primaryColor100, // Use primary color
            controlAffinity:
                ListTileControlAffinity.trailing, // Radio button on the right
          ),
          RadioListTile<String>(
            // Specify type argument
            title: Text(
              'Alphabetical (A - Z)', // Changed text
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: fifteenPx,
                color: context.color.titleColor,
                // fontWeight: FontWeight.w500, // Keep if desired
              ),
            ),
            value: 'alpha', // Assign unique value
            groupValue: currentSortGroup, // Connect to state
            onChanged: (value) {
              // TODO: Call presenter method to update sorting
              // presenter.setSortOrder('alpha');
              Navigator.pop(context); // Close bottom sheet on selection
            },
            activeColor: context.color.primaryColor100, // Use primary color
            controlAffinity:
                ListTileControlAffinity.trailing, // Radio button on the right
          ),
          // Add vertical space at the bottom
          SizedBox(
              height: MediaQuery.of(context).padding.bottom +
                  tenPx), // Respect safe area bottom padding
        ],
      ),
    );
  }
}
