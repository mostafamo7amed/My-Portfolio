import 'package:flutter/material.dart';

import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_styles.dart';

class CopyRightWidget extends StatelessWidget {
  const CopyRightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: const BoxDecoration(
        color: AppColors.darkGray50,
      ),
      child: Text(
        'Copyright © 2025 - All rights reserved',
        style: AppTextStyles.font14MediumDarkGray600(context).copyWith(fontSize: 12),
      ),
    );
  }
}
