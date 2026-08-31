import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const String fontFamily = 'inter';

  static TextStyle font16MediumDarkGray600(BuildContext context) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.getTextSecondary(context),
      );

  static TextStyle font16NormalDarkGray600(BuildContext context) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.getTextSecondary(context),
      );

  static TextStyle font16NormalDarkGray500(BuildContext context) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkGray500
            : AppColors.lightTextMuted,
      );

  static TextStyle font16MediumDarkGray50(BuildContext context) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkGray50
            : AppColors.lightBg,
      );

  static TextStyle font14MediumDarkGray600(BuildContext context) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.getTextSecondary(context),
      );

  static TextStyle font60BoldDarkGray900(BuildContext context) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 60,
        fontWeight: FontWeight.w700,
        color: AppColors.getTextPrimary(context),
      );

  static TextStyle font60BoldLogoColor(BuildContext context) => const TextStyle(
        fontFamily: fontFamily,
        fontSize: 60,
        fontWeight: FontWeight.w700,
        color: AppColors.logoColor,
      );

  static TextStyle font20NormalDarkGray600(BuildContext context) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppColors.getTextSecondary(context),
      );

  static TextStyle font18NormalDarkGray600(BuildContext context) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.getTextSecondary(context),
      );

  static TextStyle font20SemiBoldDarkGray900(BuildContext context) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.getTextPrimary(context),
      );

  static TextStyle font18SemiBoldDarkGray900(BuildContext context) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.getTextPrimary(context),
      );

  static TextStyle font30SemiBoldDarkGray900(BuildContext context) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: AppColors.getTextPrimary(context),
      );

  static TextStyle font36BoldLogoColor(BuildContext context) => const TextStyle(
        fontFamily: fontFamily,
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: AppColors.logoColor,
      );
}
