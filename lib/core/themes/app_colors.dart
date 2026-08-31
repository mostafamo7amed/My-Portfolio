import 'package:flutter/material.dart';

class AppColors {
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color logoColor = Color(0xFFff715a);
  static const Color primaryColor = Color(0xFF0d1b27);

  // Dark Theme Palette
  static const Color darkBg = Color(0xFF030712);
  static const Color darkCard = Color(0xFF111827);
  static const Color darkCardSecondary = Color(0xFF1F2937);
  static const Color darkBorder = Color(0xFF374151);
  static const Color darkGray = Color(0xFF030712);
  static const Color darkGray50 = Color(0xFF111827);
  static const Color darkGray100 = Color(0xFF1f2937);
  static const Color darkGray200 = Color(0xFF374151);
  static const Color darkGray300 = Color(0xFF4b5563);
  static const Color darkGray400 = Color(0xFF6b7280);
  static const Color darkGray500 = Color(0xFF9ca3af);
  static const Color darkGray600 = Color(0xFFd1d5db);
  static const Color darkGray700 = Color(0xFFe5e7eb);
  static const Color darkGray800 = Color(0xFFf3f4f6);
  static const Color darkGray900 = Color(0xFFf9fafb);

  // Light Theme Palette
  static const Color lightBg = Color(0xFFF8FAFC);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightCardSecondary = Color(0xFFF1F5F9);
  static const Color lightBorder = Color(0xFFE2E8F0);
  static const Color lightTextPrimary = Color(0xFF0F172A);
  static const Color lightTextSecondary = Color(0xFF475569);
  static const Color lightTextMuted = Color(0xFF64748B);

  // Backward-compatible lightGray constants
  static const Color lightGray50 = Color(0xFFf9fafb);
  static const Color lightGray100 = Color(0xFFf3f4f6);
  static const Color lightGray200 = Color(0xFFe5e7eb);
  static const Color lightGray300 = Color(0xFFd1d5db);
  static const Color lightGray400 = Color(0xFF9ca3af);
  static const Color lightGray500 = Color(0xFF6b7280);
  static const Color lightGray600 = Color(0xFF4b5563);
  static const Color lightGray700 = Color(0xFF374151);
  static const Color lightGray800 = Color(0xFF1f2937);
  static const Color lightGray900 = Color(0xFF111827);
  static const Color lightGray950 = Color(0xFF030712);


  // Dynamic Theme Helpers
  static Color getBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkBg
        : lightBg;
  }

  static Color getCardColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkCard
        : lightCard;
  }

  static Color getCardSecondaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkCardSecondary
        : lightCardSecondary;
  }

  static Color getBorderColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white.withValues(alpha: 0.08)
        : Colors.black.withValues(alpha: 0.08);
  }

  static Color getTextPrimary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? white
        : lightTextPrimary;
  }

  static Color getTextSecondary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkGray600
        : lightTextSecondary;
  }
}
