import 'package:flutter/material.dart';

import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_styles.dart';

class TitleBoxWidget extends StatelessWidget {
  final String text;

  const TitleBoxWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(7),
      child: Text(
        text,
        style: AppTextStyles.font30SemiBoldDarkGray900(context)
            .copyWith(color: AppColors.white),
      ),
    );
  }
}
