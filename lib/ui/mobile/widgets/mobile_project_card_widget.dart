import 'package:flutter/material.dart';
import '/core/models/project_model.dart';
import '/ui/widgets/project_tag_widget.dart';
import '../../../core/helpers/spaces.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';
import '../../../core/utils/utils.dart';

class MobileProjectCardWidget extends StatelessWidget {
  final ProjectModel project;

  const MobileProjectCardWidget({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: (isDark ? AppColors.darkCardSecondary : AppColors.lightCardSecondary)
                  .withValues(alpha: isDark ? 0.7 : 0.95),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              border: Border(
                top: BorderSide(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.08)
                        : Colors.black.withValues(alpha: 0.08)),
                left: BorderSide(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.08)
                        : Colors.black.withValues(alpha: 0.08)),
                right: BorderSide(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.08)
                        : Colors.black.withValues(alpha: 0.08)),
              ),
            ),
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: project.image.startsWith('http')
                  ? Image.network(
                      project.image,
                      height: 220,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => Icon(
                        Icons.image_outlined,
                        size: 60,
                        color: isDark ? Colors.white30 : Colors.black26,
                      ),
                    )
                  : Image.asset(
                      project.image,
                      height: 220,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => Icon(
                        Icons.image_outlined,
                        size: 60,
                        color: isDark ? Colors.white30 : Colors.black26,
                      ),
                    ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: (isDark ? AppColors.darkCard : AppColors.lightCard)
                  .withValues(alpha: isDark ? 0.7 : 0.95),
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
              border: Border(
                bottom: BorderSide(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.08)
                        : Colors.black.withValues(alpha: 0.08)),
                left: BorderSide(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.08)
                        : Colors.black.withValues(alpha: 0.08)),
                right: BorderSide(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.08)
                        : Colors.black.withValues(alpha: 0.08)),
              ),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        project.title,
                        style: AppTextStyles.font18SemiBoldDarkGray900(context),
                      ),
                    ),
                    if (project.dateRange.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.logoColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          project.dateRange,
                          style: AppTextStyles.font16NormalDarkGray500(context)
                              .copyWith(
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
                  project.description,
                  style: AppTextStyles.font16NormalDarkGray600(context).copyWith(
                    height: 1.45,
                  ),
                ),
                verticalSpace(15),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: project.tags
                      .map((e) => ProjectTagWidget(tag: e))
                      .toList(),
                ),
                verticalSpace(18),
                // Action Store & Code Links
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    if (project.appStoreLink.isNotEmpty)
                      _MobileStoreBtn(
                        icon: Icons.apple_rounded,
                        label: 'App Store',
                        onTap: () => launchUrlFunction(project.appStoreLink),
                        color: const Color(0xFF0284C7),
                      ),
                    if (project.playStoreLink.isNotEmpty)
                      _MobileStoreBtn(
                        icon: Icons.shop_rounded,
                        label: 'Google Play',
                        onTap: () => launchUrlFunction(project.playStoreLink),
                        color: const Color(0xFF10B981),
                      ),
                    if (project.githubLink.isNotEmpty)
                      _MobileStoreBtn(
                        icon: Icons.code_rounded,
                        label: 'Code',
                        onTap: () => launchUrlFunction(project.githubLink),
                        color: AppColors.logoColor,
                      ),
                    if (project.demoLink.isNotEmpty)
                      _MobileStoreBtn(
                        icon: Icons.play_circle_fill_rounded,
                        label: 'Demo',
                        onTap: () => launchUrlFunction(project.demoLink),
                        color: const Color(0xFF7C5CFF),
                      ),
                    if (project.link.isNotEmpty &&
                        project.appStoreLink.isEmpty &&
                        project.playStoreLink.isEmpty &&
                        project.githubLink.isEmpty)
                      _MobileStoreBtn(
                        icon: Icons.open_in_new_rounded,
                        label: 'Open',
                        onTap: () => launchUrlFunction(project.link),
                        color: AppColors.logoColor,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileStoreBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color color;

  const _MobileStoreBtn({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: color.withValues(alpha: isDark ? 0.12 : 0.10),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: color.withValues(alpha: 0.35),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : AppColors.lightTextPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
