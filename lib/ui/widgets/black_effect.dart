import 'package:flutter/material.dart';
import 'package:my_personal_portfolio/core/themes/app_colors.dart';

Widget mBlackEffect(double? width, double? height, {double? radiusValue = 16}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.darkGray.withValues(alpha: 0.3),
          AppColors.darkGray.withValues(alpha: 0.2),
          AppColors.darkGray.withValues(alpha: 0.2),
          AppColors.darkGray.withValues(alpha: 0.2),
          AppColors.darkGray.withValues(alpha: 0.3),
          AppColors.darkGray.withValues(alpha: 0.5),
          AppColors.darkGray.withValues(alpha: 0.6),
          AppColors.darkGray.withValues(alpha: 0.7),
          AppColors.darkGray.withValues(alpha: 0.8),
          AppColors.darkGray.withValues(alpha: 0.9),
          AppColors.darkGray.withValues(alpha: 1),
        ],
      ),
    ),
    alignment: Alignment.bottomLeft,
  );
}
Widget bBlackEffect(double? width, double? height, {double? radiusValue = 16}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.darkGray.withValues(alpha: 0.4),
          AppColors.darkGray.withValues(alpha: 0.4),
          AppColors.darkGray.withValues(alpha: 0.4),
          AppColors.darkGray.withValues(alpha: 0.4),
          AppColors.darkGray.withValues(alpha: 0.4),
          AppColors.darkGray.withValues(alpha: 0.5),
        ],
      ),
    ),
    alignment: Alignment.bottomLeft,
  );
}