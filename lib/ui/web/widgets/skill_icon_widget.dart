import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/core/models/skills_model.dart';
import '../../../core/helpers/spaces.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';

class SkillIconWidget extends StatefulWidget {
  final SkillsModel skill;

  const SkillIconWidget({super.key, required this.skill});

  @override
  State<SkillIconWidget> createState() => _SkillIconWidgetState();
}

class _SkillIconWidgetState extends State<SkillIconWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          transform: Matrix4.identity()
            ..translate(0.0, _isHovered ? -8.0 : 0.0)
            ..scale(_isHovered ? 1.08 : 1.0),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppColors.logoColor.withValues(alpha: 0.15)
                : Colors.white.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered
                  ? AppColors.logoColor
                  : Colors.white.withValues(alpha: 0.08),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? AppColors.logoColor.withValues(alpha: 0.3)
                    : Colors.transparent,
                blurRadius: _isHovered ? 20 : 0,
                offset: Offset(0, _isHovered ? 8 : 0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedRotation(
                turns: _isHovered ? 0.03 : 0.0,
                duration: const Duration(milliseconds: 250),
                child: SvgPicture.asset(
                  widget.skill.image,
                  height: 54,
                  width: 54,
                ),
              ),
              verticalSpace(10),
              Text(
                widget.skill.title,
                style: AppTextStyles.font18NormalDarkGray600(context).copyWith(
                  color: _isHovered ? AppColors.white : AppColors.lightGray300,
                  fontWeight: _isHovered ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

