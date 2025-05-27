import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_personal_portfolio/ui/widgets/skills_banner.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/utils/utils.dart';
import '/core/data/my_data.dart';
import '/ui/widgets/social_icons_widget.dart';
import '/ui/web/widgets/image_widget.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/helpers/spaces.dart';
import '../../../core/themes/app_text_styles.dart';

class AboutSectionWidget extends StatelessWidget {
  const AboutSectionWidget({super.key, required this.scrollController});

  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, I’m ${myData.name.split(' ').first} ',
                      style: AppTextStyles.font18SemiBoldDarkGray900(context)
                          .copyWith(color: AppColors.white),
                    ),
                    verticalSpace(10),
                    Text(
                      'Flutter Developer'.tr(),
                      style: AppTextStyles.font30SemiBoldDarkGray900(context)
                          .copyWith(color: AppColors.white, fontSize: 40),
                    ),
                    verticalSpace(40),
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.locationIcon),
                        horizontalSpace(5),
                        Text(
                          myData.country,
                          style: AppTextStyles.font16NormalDarkGray600(context),
                        ),
                      ],
                    ),
                    verticalSpace(10),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 6,
                        ),
                        horizontalSpace(5),
                        Text(
                          'Available for new projects'.tr(),
                          style: AppTextStyles.font16NormalDarkGray600(context),
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    Row(
                      children: [
                        SizedBox(
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.logoColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              scrollController.animateTo(
                                scrollController.position.maxScrollExtent,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Text(
                              'Contact Me'.tr(),
                              style:
                                  AppTextStyles.font16MediumDarkGray50(context)
                                      .copyWith(color: AppColors.white),
                            ),
                          ),
                        ),
                        horizontalSpace(10),
                        SizedBox(
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                    color: AppColors.logoColor),
                              ),
                            ),
                            onPressed: () {
                              launchUrlFunction(myData.cvLink);
                            },
                            child: Text(
                              'My Resume'.tr(),
                              style:
                                  AppTextStyles.font16MediumDarkGray50(context)
                                      .copyWith(color: AppColors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                    verticalSpace(40),
                    const SocialIconsWidget(),
                  ],
                ),
              ),
              horizontalSpace(20),
              const ImageWidget(),
              horizontalSpace(50),
            ],
          ),
          verticalSpace(20),
          SkillsBannerWidget(skillsBanner: skills)
        ],
      ),
    );
  }
}
