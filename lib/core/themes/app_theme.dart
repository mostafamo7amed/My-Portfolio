import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData lightAppTheme(BuildContext context) => ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBg,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.logoColor,
        brightness: Brightness.light,
        surface: AppColors.lightCard,
      ),
      iconTheme: const IconThemeData(color: AppColors.lightTextSecondary),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          hoverColor: AppColors.logoColor.withValues(alpha: 0.15),
          foregroundColor: AppColors.lightTextPrimary,
        ),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.lightCard,
      ),
    );

ThemeData darkAppTheme(BuildContext context) => ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBg,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.logoColor,
        brightness: Brightness.dark,
        surface: AppColors.darkCard,
      ),
      iconTheme: const IconThemeData(color: AppColors.darkGray600),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          hoverColor: AppColors.logoColor.withValues(alpha: 0.15),
          foregroundColor: AppColors.white,
        ),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.darkBg,
      ),
    );
