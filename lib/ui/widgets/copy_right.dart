import 'package:flutter/material.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';

class CopyRightWidget extends StatelessWidget {
  const CopyRightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      color: isDark ? AppColors.darkBg : AppColors.lightCard,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: AppTextStyles.font16NormalDarkGray600(context).copyWith(
              fontSize: 14,
            ),
            children: const [
              TextSpan(text: '© 2025 | Designed and coded by '),
              TextSpan(text: 'Mostafa Mohamed'),
            ],
          ),
        ),
      ),
    );
  }
}
