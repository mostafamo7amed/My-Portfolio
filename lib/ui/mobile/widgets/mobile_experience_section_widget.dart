import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/data/my_data.dart';
import '../../../core/helpers/global_keys.dart';
import '../../../core/helpers/spaces.dart';
import '../../../core/themes/app_colors.dart';
import '../../widgets/title_box_widget.dart';
import 'mobile_experience_card_widget.dart';

class MobileExperienceSectionWidget extends StatelessWidget {
  const MobileExperienceSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: GlobalKeys.experienceKey,
      width: double.infinity,
      color: AppColors.darkGray50,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
      child: Column(
        children: [
          TitleBoxWidget(text: 'Experience'.tr()),
          verticalSpace(10),
          Column(
            children: myData.experiences
                .map((e) => MobileExperienceCardWidget(experience: e))
                .toList(),
          ),
        ],
      ),
    );
  }
}
