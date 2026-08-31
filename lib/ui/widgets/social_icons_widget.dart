import 'package:flutter/material.dart';
import '/core/data/my_data.dart';
import '../../core/models/social_model.dart';
import '../../core/themes/app_colors.dart';
import '../../core/utils/utils.dart';

class SocialIconsWidget extends StatelessWidget {
  const SocialIconsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: myData.socialLinks.map((e) => _SocialItem(social: e)).toList(),
    );
  }
}

class _SocialItem extends StatefulWidget {
  final SocialIModel social;

  const _SocialItem({required this.social});

  @override
  State<_SocialItem> createState() => _SocialItemState();
}

class _SocialItemState extends State<_SocialItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => launchUrlFunction(widget.social.link),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          transform: Matrix4.identity()
            ..translate(0.0, _isHovered ? -5.0 : 0.0)
            ..scale(_isHovered ? 1.15 : 1.0),
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _isHovered
                ? AppColors.logoColor.withValues(alpha: 0.25)
                : Colors.white.withValues(alpha: 0.05),
            border: Border.all(
              color: _isHovered
                  ? AppColors.logoColor
                  : Colors.white.withValues(alpha: 0.15),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? AppColors.logoColor.withValues(alpha: 0.45)
                    : Colors.transparent,
                blurRadius: _isHovered ? 16 : 0,
                spreadRadius: _isHovered ? 2 : 0,
              ),
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            widget.social.icon,
            fit: BoxFit.contain,
            color: _isHovered ? Colors.white : AppColors.getTextSecondary(context),
          ),
        ),
      ),
    );
  }
}

