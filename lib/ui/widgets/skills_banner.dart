import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_personal_portfolio/core/models/skills_model.dart';

import '../../core/helpers/global_keys.dart';
import '../../core/helpers/spaces.dart';
import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_styles.dart';

class SkillsBannerWidget extends StatefulWidget {
  const SkillsBannerWidget({super.key, required this.skillsBanner});
  final List<SkillsModel> skillsBanner;
  @override
  State<SkillsBannerWidget> createState() => _SkillsBannerWidgetState();
}

class _SkillsBannerWidgetState extends State<SkillsBannerWidget> {
  final CarouselSliderController carouselSliderController =
      CarouselSliderController();
  int currentAds = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.skillsBanner
        .map((item) => Stack(
              children: [
                SizedBox(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        height: 64,
                          item.image,
                        fit: BoxFit.contain,
                          ),
                      verticalSpace(5),
                      Expanded(
                        child: Text(
                          item.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.font18NormalDarkGray600(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ))
        .toList();
    return Container(
      key: GlobalKeys.skillsKey,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider(
              items: imageSliders,
              carouselController: carouselSliderController,
              options: CarouselOptions(
                height: 180,
                  viewportFraction: 0.155,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 1),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.2,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentAds = index;
                    });
                  }),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.skillsBanner.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => carouselSliderController.animateToPage(entry.key),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (currentAds == entry.key
                            ? AppColors.logoColor
                            : AppColors.lightGray500)),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
