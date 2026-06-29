import 'package:flutter/material.dart';

/// AppColors defines the color palette for the Warsha application
/// Primary: Orange (#FF6B00)
/// Dark: Charcoal (#1A1A1A) & Black (#000000)
abstract class AppColors {
  // Primary Brand Colors
  static const Color primaryOrange = Color(0xFFFF6B00);
  static const Color primaryOrangeDark = Color(0xFFE55A00);
  static const Color primaryOrangeLight = Color(0xFFFFB84D);
  static const Color primaryGold = Color(0xFFC9740C);


  // Dark Theme Colors
  static const Color darkBg = Color(0xFF1A1A1A);
  static const Color darkBgSecondary = Color(0xFF2D2D2D);
  static const Color darkBgTertiary = Color(0xFF3F3F3F);
  static const Color darkCardBg = Color(0xFF252525);

  // Light Theme Colors
  static const Color lightBg = Color(0xFFFAFAFA);
  static const Color lightBgSecondary = Color(0xFFF5F5F5);
  static const Color lightCardBg = Color(0xFFFFFFFF);

  // Neutral Colors
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textLight = Color(0xFFFFFFFF);
  static const Color textGrey = Color(0xFF757575);
  static const Color textGreyLight = Color(0xFFA0A0A0);

  // Semantic Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFFC107);
  static const Color info = Color(0xFF2196F3);

  // Borders & Dividers
  static const Color border = Color(0xFFE0E0E0);
  static const Color borderDark = Color(0xFF424242);

  // Shadow
  static const Color shadow = Color(0x1A000000);

  // Transparent
  static const Color transparent = Color(0x00000000);
}
