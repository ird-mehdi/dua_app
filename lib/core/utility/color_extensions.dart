import 'package:flutter/material.dart';

extension ColorExtension on Color {
  /// Returns a new color that matches this color with the alpha value
  /// The opacity parameter must be an integer value between 0 and 100
  Color withOpacityInt(int opacity) {
    assert(opacity >= 0 && opacity <= 100, 'opacity must be between 0 and 100');
    final normalizedOpacity = opacity / 100;
    return withOpacity(normalizedOpacity);
  }
}
