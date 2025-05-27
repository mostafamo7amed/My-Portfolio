import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_personal_portfolio/core/helpers/scroll_to_key.dart';
import '/core/data/my_data.dart';
import '../../../core/helpers/global_keys.dart';
import '../../widgets/header_text_button_widget.dart';

import '../../../core/helpers/spaces.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';

class WebHeaderWidget extends StatelessWidget {
  const WebHeaderWidget({super.key, required this.scrollController});

  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 80.0, right: 80.0, top: 15),
      child: Row(
        children: [
          Image.asset(
            myData.logo,
            height: 50,
            width: 50,
            fit: BoxFit.contain,
          ),
          horizontalSpace(10),
          Text(
            myData.name.tr(),
            style: AppTextStyles.font18SemiBoldDarkGray900(context)
                .copyWith(color: AppColors.white),
          ),
          const Spacer(),
          HeaderTextButtonWidget(
            text: 'About'.tr(),
            onPressed: () {
              scrollToKey(GlobalKeys.aboutKey);
            },
          ),
         /* horizontalSpace(10),
          HeaderTextButtonWidget(
            text: 'Skills'.tr(),
            onPressed: () {
              Scrollable.ensureVisible(
                GlobalKeys.skillsKey.currentContext!,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              );
            },
          ),*/
          horizontalSpace(10),
          HeaderTextButtonWidget(
            text: 'Experience'.tr(),
            onPressed: () {
              scrollToKey(GlobalKeys.experienceKey);
            },
          ),
          horizontalSpace(10),
          HeaderTextButtonWidget(
            text: 'Projects'.tr(),
            onPressed: () {
              scrollToKey(GlobalKeys.projectsKey);
            },
          ),
          horizontalSpace(10),
          HeaderTextButtonWidget(
            text: 'Contact'.tr(),
            onPressed: () {
              scrollController.animateTo(
                scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            },
          ),
        ],
      ),
    );
  }
}
