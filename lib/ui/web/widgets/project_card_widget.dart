import 'package:flutter/material.dart';
import '/core/models/project_model.dart';
import '/ui/widgets/project_tag_widget.dart';
import '../../../core/helpers/spaces.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';
import '../../../core/utils/utils.dart';

class ProjectCardWidget extends StatefulWidget {
  final ProjectModel project;
  final int index;

  const ProjectCardWidget({
    super.key,
    required this.project,
    required this.index,
  });

  @override
  State<ProjectCardWidget> createState() => _ProjectCardWidgetState();
}

class _ProjectCardWidgetState extends State<ProjectCardWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isEvenIndex = widget.index % 2 == 0;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        transform: Matrix4.identity()
          ..translate(0.0, _isHovered ? -4.0 : 0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: (isDark ? AppColors.darkCard : AppColors.lightCard)
              .withValues(alpha: isDark ? 0.75 : 0.90),
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
              blurRadius: _isHovered ? 24 : 12,
              offset: Offset(0, _isHovered ? 8 : 4),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            if (isEvenIndex) _imageWidget(widget.project.image, isDark),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.project.title,
                            style: AppTextStyles.font20SemiBoldDarkGray900(context),
                          ),
                        ),
                        if (widget.project.dateRange.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.logoColor.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              widget.project.dateRange,
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
                    verticalSpace(12),
                    Text(
                      widget.project.description,
                      style: AppTextStyles.font16NormalDarkGray600(context).copyWith(
                        height: 1.5,
                      ),
                    ),
                    verticalSpace(15),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.project.tags
                          .map((e) => ProjectTagWidget(tag: e))
                          .toList(),
                    ),
                    verticalSpace(20),
                    // Action Store & Code Links Row
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        if (widget.project.appStoreLink.isNotEmpty)
                          _StoreButton(
                            icon: Icons.apple_rounded,
                            label: 'App Store',
                            onTap: () => launchUrlFunction(widget.project.appStoreLink),
                            color: const Color(0xFF0284C7),
                          ),
                        if (widget.project.playStoreLink.isNotEmpty)
                          _StoreButton(
                            icon: Icons.shop_rounded,
                            label: 'Google Play',
                            onTap: () => launchUrlFunction(widget.project.playStoreLink),
                            color: const Color(0xFF10B981),
                          ),
                        if (widget.project.githubLink.isNotEmpty)
                          _StoreButton(
                            icon: Icons.code_rounded,
                            label: 'Code',
                            onTap: () => launchUrlFunction(widget.project.githubLink),
                            color: AppColors.logoColor,
                          ),
                        if (widget.project.demoLink.isNotEmpty)
                          _StoreButton(
                            icon: Icons.play_circle_fill_rounded,
                            label: 'Demo',
                            onTap: () => launchUrlFunction(widget.project.demoLink),
                            color: const Color(0xFF7C5CFF),
                          ),
                        if (widget.project.link.isNotEmpty &&
                            widget.project.appStoreLink.isEmpty &&
                            widget.project.playStoreLink.isEmpty &&
                            widget.project.githubLink.isEmpty)
                          _StoreButton(
                            icon: Icons.open_in_new_rounded,
                            label: 'Open',
                            onTap: () => launchUrlFunction(widget.project.link),
                            color: AppColors.logoColor,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (!isEvenIndex) _imageWidget(widget.project.image, isDark),
          ],
        ),
      ),
    );
  }

  Widget _imageWidget(String image, bool isDark) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Container(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.3)
                  : Colors.black.withValues(alpha: 0.04),
              padding: const EdgeInsets.all(12),
              child: image.startsWith('http')
                  ? Image.network(
                      image,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => Icon(
                        Icons.image_outlined,
                        size: 60,
                        color: isDark ? Colors.white30 : Colors.black26,
                      ),
                    )
                  : Image.asset(
                      image,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => Icon(
                        Icons.image_outlined,
                        size: 60,
                        color: isDark ? Colors.white30 : Colors.black26,
                      ),
                    ),
            ),
          ),
        ),
      );
}

class _StoreButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color color;

  const _StoreButton({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.color,
  });

  @override
  State<_StoreButton> createState() => _StoreButtonState();
}

class _StoreButtonState extends State<_StoreButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: _hover
                ? widget.color.withValues(alpha: 0.22)
                : widget.color.withValues(alpha: isDark ? 0.08 : 0.12),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _hover
                  ? widget.color
                  : widget.color.withValues(alpha: 0.35),
              width: 1.2,
            ),
            boxShadow: _hover
                ? [
                    BoxShadow(
                      color: widget.color.withValues(alpha: 0.35),
                      blurRadius: 12,
                      offset: const Offset(0, 3),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, size: 17, color: widget.color),
              const SizedBox(width: 6),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : AppColors.lightTextPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
