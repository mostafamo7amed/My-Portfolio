import 'package:flutter/material.dart';
import '/core/models/experience_model.dart';
import '../../../core/helpers/spaces.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';

class ExperienceCardWidget extends StatefulWidget {
  final ExperienceModel experience;

  const ExperienceCardWidget({super.key, required this.experience});

  @override
  State<ExperienceCardWidget> createState() => _ExperienceCardWidgetState();
}

class _ExperienceCardWidgetState extends State<ExperienceCardWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -4.0 : 0.0),
        decoration: BoxDecoration(
          color: (isDark ? AppColors.darkCard : AppColors.lightCard)
              .withValues(alpha: isDark ? 0.75 : 0.90),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? AppColors.logoColor.withValues(alpha: 0.5)
                : (isDark
                    ? Colors.white.withValues(alpha: 0.08)
                    : Colors.black.withValues(alpha: 0.08)),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppColors.logoColor.withValues(alpha: 0.18)
                  : (isDark
                      ? Colors.black.withValues(alpha: 0.25)
                      : Colors.black.withValues(alpha: 0.06)),
              blurRadius: _isHovered ? 20 : 10,
              offset: Offset(0, _isHovered ? 6 : 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 80,
                height: 80,
                color: isDark
                    ? Colors.white.withValues(alpha: 0.05)
                    : Colors.black.withValues(alpha: 0.04),
                padding: const EdgeInsets.all(8),
                child: widget.experience.image.startsWith('http')
                    ? Image.network(
                        widget.experience.image,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => Icon(
                          Icons.business_rounded,
                          size: 40,
                          color: isDark ? Colors.white30 : Colors.black26,
                        ),
                      )
                    : Image.asset(
                        widget.experience.image,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => Icon(
                          Icons.business_rounded,
                          size: 40,
                          color: isDark ? Colors.white30 : Colors.black26,
                        ),
                      ),
              ),
            ),
            horizontalSpace(30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.experience.title,
                          style: AppTextStyles.font20SemiBoldDarkGray900(context),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.logoColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          widget.experience.duration,
                          style: AppTextStyles.font16NormalDarkGray500(context)
                              .copyWith(
                            fontSize: 12,
                            color: AppColors.logoColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (widget.experience.company.isNotEmpty) ...[
                    verticalSpace(4),
                    Text(
                      widget.experience.company,
                      style: AppTextStyles.font16NormalDarkGray600(context).copyWith(
                        color: const Color(0xFF0284C7),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                  verticalSpace(4),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: isDark
                              ? Colors.white.withValues(alpha: 0.08)
                              : Colors.black.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          widget.experience.type,
                          style: AppTextStyles.font16NormalDarkGray600(context)
                              .copyWith(fontSize: 12),
                        ),
                      ),
                      if (widget.experience.location.isNotEmpty) ...[
                        horizontalSpace(10),
                        Icon(Icons.location_on_outlined,
                            size: 14,
                            color: isDark
                                ? AppColors.darkGray500
                                : AppColors.lightTextMuted),
                        horizontalSpace(4),
                        Text(
                          widget.experience.location,
                          style: AppTextStyles.font16NormalDarkGray500(context)
                              .copyWith(fontSize: 12),
                        ),
                      ],
                    ],
                  ),
                  verticalSpace(14),
                  Text(
                    widget.experience.description,
                    style: AppTextStyles.font16NormalDarkGray600(context).copyWith(
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
