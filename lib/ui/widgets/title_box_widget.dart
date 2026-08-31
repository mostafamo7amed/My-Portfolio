import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/helpers/spaces.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';
import '../widgets/floating_icon_widget.dart';

class TitleBoxWidget extends StatelessWidget {
  final String text;
  final IconData? icon;

  const TitleBoxWidget({super.key, required this.text, this.icon});

  IconData _getIconForTitle(String title) {
    if (icon != null) return icon!;
    final lower = title.toLowerCase();
    if (lower.contains('about') || lower.contains('عنى')) {
      return Icons.person_rounded;
    } else if (lower.contains('skill') || lower.contains('المهار')) {
      return Icons.auto_awesome_rounded;
    } else if (lower.contains('experience') || lower.contains('الخبر')) {
      return Icons.work_rounded;
    } else if (lower.contains('project') || lower.contains('المشار')) {
      return Icons.grid_view_rounded;
    } else if (lower.contains('review') || lower.contains('التقييم')) {
      return Icons.star_rounded;
    } else if (lower.contains('touch') || lower.contains('contact') || lower.contains('تواصل')) {
      return Icons.mail_rounded;
    }
    return Icons.star_rounded;
  }

  @override
  Widget build(BuildContext context) {
    final displayIcon = _getIconForTitle(text);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Floating Icon Badge
          FloatingIconWidget(
            distance: 5.0,
            duration: const Duration(seconds: 3),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [
                    AppColors.logoColor,
                    Color(0xFF7C5CFF),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.logoColor.withValues(alpha: 0.35),
                    blurRadius: 14,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Icon(
                displayIcon,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          verticalSpace(10),
          // Section Title Pill Container
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.08)
                  : Colors.black.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.12)
                    : Colors.black.withValues(alpha: 0.08),
                width: 1,
              ),
            ),
            child: Text(
              text.tr(),
              style: AppTextStyles.font14MediumDarkGray600(context).copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: 0.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
