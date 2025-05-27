import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import '../../../core/helpers/global_keys.dart';
import '/core/data/my_data.dart';

import '../../../core/helpers/spaces.dart';
import '../../../core/themes/app_colors.dart';
import 'experience_card_widget.dart';
import '../../widgets/title_box_widget.dart';

class ExperienceSectionWidget extends StatelessWidget {
  const ExperienceSectionWidget({super.key});
  static const String id = '/ExperienceSectionWidget';

  @override
  Widget build(BuildContext context) {
    return Container(
      key: GlobalKeys.experienceKey,
      width: double.infinity,
      color: AppColors.darkGray50,
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 60),
      child: Column(
        children: [
          TitleBoxWidget(text: 'Experience'.tr()),
          verticalSpace(20),
          Column(
            children: myData.experiences
                .map((e) => ExperienceCardWidget(experience: e))
                .toList(),
          ),
        ],
      ),
    );
  }
}
