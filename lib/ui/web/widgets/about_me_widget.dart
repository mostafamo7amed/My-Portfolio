import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_personal_portfolio/core/themes/app_colors.dart';
import '../../../core/helpers/global_keys.dart';
import '/core/data/my_data.dart';
import '../../widgets/title_box_widget.dart';

import '../../../core/helpers/spaces.dart';
import '../../../core/themes/app_text_styles.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: GlobalKeys.aboutKey,
      width: double.infinity,
      color: Theme.of(context).brightness == Brightness.dark ? Colors.transparent : AppColors.logoColor.withValues(alpha: 0.15),
      padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 60),
      child: Column(
        children: [
          TitleBoxWidget(text: 'About Me'.tr()),
          verticalSpace(20),
          Text(
            myData.profileSummary,
            style: AppTextStyles.font16NormalDarkGray600(context),
          ),
        ],
      ),
    );
  }
}
