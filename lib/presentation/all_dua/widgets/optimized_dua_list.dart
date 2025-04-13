import 'package:dua/core/utility/utility.dart';
import 'package:dua/core/config/dua_screen.dart';
import 'package:dua/domain/entities/dua_entity.dart';
import 'package:dua/presentation/dua_details/ui/dua_details_page.dart';
import 'package:flutter/material.dart';
import 'package:characters/characters.dart';

// Helper class to represent sections in the list
class _ListSection {
  final String letter;
  final DuaEntity? dua;
  final bool isHeader;

  _ListSection({
    this.letter = '',
    this.dua,
    required this.isHeader,
  });
}

class OptimizedDuaList extends StatelessWidget {
  final List<DuaEntity> duas;
  final ScrollController? controller;
  final ThemeData theme;
  final String selectedLanguage; // Keep original name for compatibility
  final double headerHeight;
  final double itemHeight;
  final Function(DuaEntity)? onItemTap;

  // Use late final to compute grouped data once per instance
  late final List<_ListSection> groupedData;

  OptimizedDuaList({
    super.key,
    required this.duas,
    this.controller,
    required this.theme,
    required this.selectedLanguage,
    this.headerHeight = 50.0, // Use default values that match our constants
    this.itemHeight = 60.0,
    this.onItemTap,
  }) {
    // Compute grouped data in the constructor
    groupedData = _computeGroupedData(duas, selectedLanguage);
  }

  // Make _computeGroupedData static or top-level if it doesn't need instance members
  static List<_ListSection> _computeGroupedData(
      List<DuaEntity> duas, String languageId) {
    final result = <_ListSection>[];
    final Map<String, List<DuaEntity>> groupedDuas = {};

    // Group duas by first letter respecting language
    for (var dua in duas) {
      if (dua.name.isNotEmpty) {
        // Use characters package for safety
        final firstChar = dua.name.characters.first.toUpperCase();
        groupedDuas.putIfAbsent(firstChar, () => []).add(dua);
      }
    }

    // Sort letters (consider language-specific sorting)
    final sortedLetters = groupedDuas.keys.toList()..sort(); // Basic sort

    for (final letter in sortedLetters) {
      result.add(_ListSection(letter: letter, isHeader: true));
      // Sort duas within the group alphabetically by name
      final sortedDuas = groupedDuas[letter]!
        ..sort((a, b) => a.name.compareTo(b.name));
      for (final dua in sortedDuas) {
        result.add(_ListSection(dua: dua, isHeader: false));
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    // groupedData is now computed once per instance creation

    return ListView.builder(
      controller: controller,
      itemCount: groupedData.length,
      cacheExtent: 500, // Keep reasonable cache extent
      itemBuilder: (context, index) {
        final section = groupedData[index];

        if (section.isHeader) {
          return _buildSectionHeader(context, section.letter);
        } else {
          // Ensure dua is not null
          if (section.dua != null) {
            return _buildDuaItem(context, section.dua!);
          } else {
            // Should not happen based on _computeGroupedData logic, but handle defensively
            return const SizedBox.shrink();
          }
        }
      },
    );
  }

  Widget _buildSectionHeader(BuildContext context, String letter) {
    // Use the passed header height
    return Container(
      height: headerHeight,
      padding: EdgeInsets.symmetric(horizontal: sixteenPx),
      color: context.color.shadeColor.withOpacityInt(0.3),
      alignment: Alignment.centerLeft,
      child: CircleAvatar(
        backgroundColor: context.color.primaryColor100,
        child: Text(
          letter,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildDuaItem(BuildContext context, DuaEntity dua) {
    // Use the passed item height
    return SizedBox(
      height: itemHeight,
      child: ListTile(
        title: Text(
          dua.name,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: context.color.titleColor,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        onTap: () {
          if (onItemTap != null) {
            onItemTap!(dua);
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DuaDetailsPage(dua: dua),
              ),
            );
          }
        },
      ),
    );
  }
}
