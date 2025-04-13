import 'package:dua/core/di/service_locator.dart';
import 'package:dua/domain/entities/dua_entity.dart';
import 'package:dua/presentation/all_dua/presenter/all_dua_presenter.dart';
import 'package:dua/presentation/dua_details/ui/dua_details_page.dart';
import 'package:flutter/material.dart';
import 'package:dua/core/utility/utility.dart';
import 'package:dua/core/config/dua_screen.dart';

class DuaListItem extends StatelessWidget {
  final int number;
  final String text;
  final bool isHighlighted;
  final VoidCallback? onTap;
  final ThemeData theme;

  const DuaListItem({
    required this.number,
    required this.text,
    this.isHighlighted = false,
    this.onTap,
    super.key,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final AllDuasPresenter presenter = locate<AllDuasPresenter>();
    final duas = presenter.uiState.value.duas ?? [];

    if (duas.isEmpty) {
      return const Center(child: Text('No duas found'));
    }

    return OptimizedDuaList(
      duas: duas,
      controller: presenter.uiState.value.scrollController,
      theme: theme,
    );
  }
}

class OptimizedDuaList extends StatelessWidget {
  final List<DuaEntity> duas;
  final ScrollController? controller;
  final ThemeData theme;

  const OptimizedDuaList({
    super.key,
    required this.duas,
    required this.controller,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    // Pre-compute the groups outside of build to improve performance
    // This section analyzes the data once instead of on every rebuild
    final groupedData = _computeGroupedData();

    return ListView.builder(
      controller: controller,
      itemCount: groupedData.length,
      cacheExtent: 500, // Increase cache to reduce rebuilds when scrolling
      itemBuilder: (context, index) {
        final section = groupedData[index];

        if (section.isHeader) {
          // Render section header
          return _buildSectionHeader(context, section.letter);
        } else {
          // Render dua item - optimized to render only visible items
          return _buildDuaItem(context, section.dua!);
        }
      },
    );
  }

  // Pre-compute the grouped data to improve performance
  List<_ListSection> _computeGroupedData() {
    final result = <_ListSection>[];
    final Map<String, List<DuaEntity>> groupedDuas = {};

    // Group duas by first letter
    for (var dua in duas) {
      if (dua.name.isNotEmpty) {
        final firstLetter = dua.name[0].toUpperCase();
        groupedDuas.putIfAbsent(firstLetter, () => []).add(dua);
      }
    }

    // Create flat list with headers and items
    final sortedLetters = groupedDuas.keys.toList()..sort();

    for (final letter in sortedLetters) {
      // Add header section
      result.add(_ListSection(letter: letter, isHeader: true));

      // Add all duas in this section
      for (final dua in groupedDuas[letter]!) {
        result.add(_ListSection(dua: dua, isHeader: false));
      }
    }

    return result;
  }

  Widget _buildSectionHeader(BuildContext context, String letter) {
    return Container(
      height: 50, // Fixed header height
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
    return SizedBox(
      height: 60, // Fixed item height
      child: ListTile(
        title: Text(
          dua.name,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: context.color.titleColor,
          ),
          // Add overflow to handle long text more efficiently
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DuaDetailsPage(dua: dua),
            ),
          );
        },
      ),
    );
  }
}

// Helper class to represent either a section header or a dua item
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
