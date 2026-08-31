import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/cubit/portfolio_cubit.dart';
import '../../../core/utils/utils.dart';
import '/ui/widgets/header_text_button_widget.dart';
import '../../../core/helpers/scroll_to_key.dart';
import '../../../core/data/my_data.dart';
import '../../../core/helpers/global_keys.dart';
import '../../../core/helpers/spaces.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.darkGray50.withValues(alpha: 0.95),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  myData.logo,
                  width: 110,
                ),
                IconButton(
                    onPressed: () {
                      GlobalKeys.mainKey.currentState!.closeEndDrawer();
                    },
                    icon: const Icon(Icons.close, color: AppColors.white)),
              ],
            ),
            const Divider(
              color: AppColors.darkGray100,
              thickness: 1,
            ),
            verticalSpace(15),
            HeaderTextButtonWidget(
              text: 'About'.tr(),
              onPressed: () {
                GlobalKeys.mainKey.currentState!.closeEndDrawer();
                scrollToKey(GlobalKeys.aboutKey);
              },
            ),
            verticalSpace(15),
            HeaderTextButtonWidget(
              text: 'Skills'.tr(),
              onPressed: () {
                GlobalKeys.mainKey.currentState!.closeEndDrawer();
                scrollToKey(GlobalKeys.skillsKey);
              },
            ),
            verticalSpace(15),
            HeaderTextButtonWidget(
              text: 'Experience'.tr(),
              onPressed: () {
                GlobalKeys.mainKey.currentState!.closeEndDrawer();
                scrollToKey(GlobalKeys.experienceKey);
              },
            ),
            verticalSpace(15),
            HeaderTextButtonWidget(
              text: 'Projects'.tr(),
              onPressed: () {
                GlobalKeys.mainKey.currentState!.closeEndDrawer();
                scrollToKey(GlobalKeys.projectsKey);
              },
            ),
            verticalSpace(15),
            HeaderTextButtonWidget(
              text: 'Reviews'.tr(),
              onPressed: () {
                GlobalKeys.mainKey.currentState!.closeEndDrawer();
                scrollToKey(GlobalKeys.reviewsKey);
              },
            ),
            verticalSpace(15),
            HeaderTextButtonWidget(
              text: 'Contact'.tr(),
              onPressed: () {
                GlobalKeys.mainKey.currentState!.closeEndDrawer();
                scrollToKey(GlobalKeys.contactKey);
              },
            ),
            verticalSpace(15),
            const Divider(
              color: AppColors.darkGray100,
              thickness: 1,
            ),
            verticalSpace(15),
            BlocBuilder<PortfolioCubit, PortfolioDataState>(
              buildWhen: (prev, curr) => prev.cvLink != curr.cvLink,
              builder: (context, state) {
                return SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkGray900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      launchUrlFunction(state.cvLink);
                    },
                    child: Text(
                      'Download CV'.tr(),
                      style: AppTextStyles.font16MediumDarkGray50(context),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
