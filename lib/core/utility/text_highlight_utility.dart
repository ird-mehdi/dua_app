import 'package:flutter/material.dart';

class TextHighlightUtility {
  static TextSpan highlightText({
    required String text,
    required List<String> queries,
    required TextStyle baseStyle,
    required TextStyle highlightStyle,
  }) {
    if (text.isEmpty || queries.isEmpty) {
      return TextSpan(text: text, style: baseStyle);
    }

    // Sort queries by length (descending) to handle longer matches first
    final List<String> sortedQueries = [...queries]..sort((a, b) => b.length.compareTo(a.length));

    // Escape special regex characters in queries
    final List<String> escapedQueries = sortedQueries.map(_escapeRegExp).toList();

    // Create pattern for all queries
    final RegExp pattern = RegExp(
      '(${escapedQueries.join("|")})',
      caseSensitive: false,
      unicode: true,
    );

    final List<TextSpan> spans = [];
    int lastIndex = 0;

    // Find all matches
    final Iterable<RegExpMatch> matches = pattern.allMatches(text);
    for (final match in matches) {
      // Add non-matching text before this match
      if (match.start > lastIndex) {
        spans.add(TextSpan(
          text: text.substring(lastIndex, match.start),
          style: baseStyle,
        ));
      }

      // Add the matched text with highlight style
      spans.add(TextSpan(
        text: text.substring(match.start, match.end),
        style: highlightStyle,
      ));

      lastIndex = match.end;
    }

    // Add any remaining text after the last match
    if (lastIndex < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastIndex),
        style: baseStyle,
      ));
    }

    return TextSpan(children: spans);
  }

  static String _escapeRegExp(String text) {
    return text.replaceAll(RegExp(r'[.*+?^${}()|[\]\\]'), r'\$&');
  }
} 