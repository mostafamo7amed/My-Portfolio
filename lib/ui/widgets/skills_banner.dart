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
    final isDesktop = MediaQuery.of(context).size.width >= 900;

    final List<Widget> imageSliders = widget.skillsBanner
        .map((item) => _SkillBannerCard(item: item))
        .toList();

    return Container(
      key: GlobalKeys.skillsKey,
      margin: const EdgeInsets.symmetric(vertical: 20),
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
                viewportFraction: isDesktop ? 0.16 : 0.35,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                autoPlayAnimationDuration: const Duration(milliseconds: 700),
                autoPlayCurve: Curves.easeInOutCubic,
                enlargeCenterPage: true,
                enlargeFactor: 0.18,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentAds = index;
                  });
                },
              ),
            ),
          ),
          Positioned(
            bottom: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.skillsBanner.asMap().entries.map((entry) {
                final isSelected = currentAds == entry.key;
                return GestureDetector(
                  onTap: () => carouselSliderController.animateToPage(entry.key),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: isSelected ? 20.0 : 7.0,
                    height: 7.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 3.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: isSelected
                          ? AppColors.logoColor
                          : Colors.white.withValues(alpha: 0.2),
                    ),
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

class _SkillBannerCard extends StatefulWidget {
  final SkillsModel item;

  const _SkillBannerCard({required this.item});

  @override
  State<_SkillBannerCard> createState() => _SkillBannerCardState();
}

class _SkillBannerCardState extends State<_SkillBannerCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        transform: Matrix4.identity()
          ..translate(0.0, _isHovered ? -5.0 : 0.0)
          ..scale(_isHovered ? 1.05 : 1.0),
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: _isHovered
              ? AppColors.logoColor.withValues(alpha: 0.15)
              : Colors.white.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? AppColors.logoColor
                : Colors.white.withValues(alpha: 0.08),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppColors.logoColor.withValues(alpha: 0.25)
                  : Colors.transparent,
              blurRadius: _isHovered ? 16 : 0,
              offset: Offset(0, _isHovered ? 6 : 0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: SvgPicture.asset(
                widget.item.image,
                height: 48,
                fit: BoxFit.contain,
              ),
            ),
            verticalSpace(6),
            Text(
              widget.item.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.font18NormalDarkGray600(context).copyWith(
                fontSize: 13,
                color: _isHovered ? Colors.white : AppColors.getTextSecondary(context),
                fontWeight: _isHovered ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


