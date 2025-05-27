import 'package:flutter/material.dart';
import 'package:my_personal_portfolio/core/constants/app_assets.dart';
import '../../widgets/black_effect.dart';
import '/core/data/my_data.dart';

import '../../../core/themes/app_colors.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImages.background,
          width: 400,
          height: 400,
          color: AppColors.logoColor,
          fit: BoxFit.cover,
        ),
        bBlackEffect(
          400,
          400,
        ),
        Positioned(
          top: -20,
          left: 0,
          right: 0,
          child: Image.network(
            myData.profile,
            width: 400,
            height: 400,
            fit: BoxFit.contain,
          ),
        ),
        mBlackEffect(
          400,
          400,
        ),
      ],
    );
  }
}
