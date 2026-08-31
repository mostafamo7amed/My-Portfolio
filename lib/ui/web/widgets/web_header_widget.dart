import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_personal_portfolio/core/helpers/scroll_to_key.dart';
import '/core/data/my_data.dart';
import '../../../core/helpers/global_keys.dart';
import '../../widgets/header_text_button_widget.dart';
import '../../widgets/theme_toggle_button.dart';
import '../../../core/helpers/spaces.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';

class WebHeaderWidget extends StatelessWidget {
  const WebHeaderWidget({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: (isDark ? AppColors.darkBg : AppColors.lightCard)
            .withValues(alpha: 0.85),
        border: Border(
          bottom: BorderSide(
            color: isDark
                ? Colors.white.withValues(alpha: 0.08)
                : Colors.black.withValues(alpha: 0.06),
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15),
      child: Row(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOutCubic,
                );
              },
              child: Row(
                children: [
                  Image.asset(
                    myData.logo,
                    height: 45,
                    width: 45,
                    fit: BoxFit.contain,
                  ),
                  horizontalSpace(12),
                  Text(
                    myData.name.tr(),
                    style: AppTextStyles.font18SemiBoldDarkGray900(context)
                        .copyWith(
                      color: isDark ? AppColors.white : AppColors.lightTextPrimary,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          HeaderTextButtonWidget(
            text: 'About'.tr(),
            onPressed: () {
              scrollToKey(GlobalKeys.aboutKey);
            },
          ),
          horizontalSpace(10),
          HeaderTextButtonWidget(
            text: 'Skills'.tr(),
            onPressed: () {
              scrollToKey(GlobalKeys.skillsKey);
            },
          ),
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
            text: 'Reviews'.tr(),
            onPressed: () {
              scrollToKey(GlobalKeys.reviewsKey);
            },
          ),
          horizontalSpace(10),
          HeaderTextButtonWidget(
            text: 'Contact'.tr(),
            onPressed: () {
              scrollToKey(GlobalKeys.contactKey);
            },
          ),
          horizontalSpace(16),
          const ThemeToggleButton(),
        ],
      ),
    );
  }
}
