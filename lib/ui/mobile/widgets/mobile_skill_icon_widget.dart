import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/helpers/spaces.dart';
import '../../../core/models/skills_model.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';

class MobileSkillIconWidget extends StatelessWidget {
  final SkillsModel skill;

  const MobileSkillIconWidget({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            skill.image,
            height: 48,
            width: 48,
          ),
          verticalSpace(8),
          Text(
            skill.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.font16NormalDarkGray600(context).copyWith(
              fontSize: 13,
              color: AppColors.lightGray300,
            ),
          ),
        ],
      ),
    );
  }
}

