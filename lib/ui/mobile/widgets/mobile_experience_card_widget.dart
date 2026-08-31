import 'package:flutter/material.dart';
import '../../../core/helpers/spaces.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';
import '/core/models/experience_model.dart';

class MobileExperienceCardWidget extends StatelessWidget {
  final ExperienceModel experience;

  const MobileExperienceCardWidget({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: (isDark ? AppColors.darkCard : AppColors.lightCard)
            .withValues(alpha: isDark ? 0.75 : 0.95),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.black.withValues(alpha: 0.08),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.2)
                : Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 60,
                  height: 60,
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.05)
                      : Colors.black.withValues(alpha: 0.04),
                  padding: const EdgeInsets.all(6),
                  child: experience.image.startsWith('http')
                      ? Image.network(
                          experience.image,
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) => Icon(
                            Icons.business_rounded,
                            size: 30,
                            color: isDark ? Colors.white30 : Colors.black26,
                          ),
                        )
                      : Image.asset(
                          experience.image,
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) => Icon(
                            Icons.business_rounded,
                            size: 30,
                            color: isDark ? Colors.white30 : Colors.black26,
                          ),
                        ),
                ),
              ),
              horizontalSpace(14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      experience.title,
                      style: AppTextStyles.font18SemiBoldDarkGray900(context),
                    ),
                    if (experience.company.isNotEmpty) ...[
                      verticalSpace(3),
                      Text(
                        experience.company,
                        style: AppTextStyles.font16NormalDarkGray600(context).copyWith(
                          fontSize: 13,
                          color: const Color(0xFF0284C7),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.08)
                      : Colors.black.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  experience.type,
                  style: AppTextStyles.font16NormalDarkGray600(context)
                      .copyWith(fontSize: 11),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.logoColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  experience.duration,
                  style: AppTextStyles.font16NormalDarkGray500(context).copyWith(
                    fontSize: 11,
                    color: AppColors.logoColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(12),
          Text(
            experience.description,
            style: AppTextStyles.font16NormalDarkGray600(context).copyWith(
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}
