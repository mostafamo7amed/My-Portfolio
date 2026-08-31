import 'package:flutter/material.dart';
import '../../core/helpers/spaces.dart';
import '../../core/models/review_model.dart';
import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_styles.dart';

class ReviewCardWidget extends StatefulWidget {
  final ReviewModel review;

  const ReviewCardWidget({super.key, required this.review});

  @override
  State<ReviewCardWidget> createState() => _ReviewCardWidgetState();
}

class _ReviewCardWidgetState extends State<ReviewCardWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final initials = widget.review.name.trim().isNotEmpty
        ? widget.review.name
            .trim()
            .split(' ')
            .take(2)
            .map((e) => e.isNotEmpty ? e[0].toUpperCase() : '')
            .join()
        : 'U';

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        transform: Matrix4.identity()
          ..translate(0.0, _isHovered ? -5.0 : 0.0),
        decoration: BoxDecoration(
          color: (isDark ? AppColors.darkCard : AppColors.lightCard)
              .withValues(alpha: isDark ? 0.75 : 0.92),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: _isHovered
                ? const Color(0xFFF59E0B).withValues(alpha: 0.5)
                : (isDark
                    ? Colors.white.withValues(alpha: 0.08)
                    : Colors.black.withValues(alpha: 0.08)),
            width: 1.3,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? const Color(0xFFF59E0B).withValues(alpha: 0.15)
                  : (isDark
                      ? Colors.black.withValues(alpha: 0.25)
                      : Colors.black.withValues(alpha: 0.06)),
              blurRadius: _isHovered ? 24 : 12,
              offset: Offset(0, _isHovered ? 8 : 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        final isFilled = index < widget.review.rating.floor();
                        return Padding(
                          padding: const EdgeInsets.only(right: 3.0),
                          child: Icon(
                            isFilled
                                ? Icons.star_rounded
                                : (index < widget.review.rating
                                    ? Icons.star_half_rounded
                                    : Icons.star_outline_rounded),
                            size: 20,
                            color: const Color(0xFFF59E0B),
                          ),
                        );
                      }),
                    ),
                    Icon(
                      Icons.format_quote_rounded,
                      size: 28,
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.15)
                          : Colors.black.withValues(alpha: 0.12),
                    ),
                  ],
                ),
                verticalSpace(14),
                Text(
                  widget.review.comment,
                  style: AppTextStyles.font16NormalDarkGray600(context).copyWith(
                    height: 1.5,
                    fontSize: 14.5,
                  ),
                ),
              ],
            ),
            verticalSpace(20),
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: AppColors.logoColor.withValues(alpha: 0.2),
                  child: widget.review.avatarUrl.isNotEmpty
                      ? ClipOval(
                          child: Image.network(
                            widget.review.avatarUrl,
                            fit: BoxFit.cover,
                            width: 44,
                            height: 44,
                            errorBuilder: (_, __, ___) => Text(
                              initials,
                              style: const TextStyle(
                                color: AppColors.logoColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      : Text(
                          initials,
                          style: const TextStyle(
                            color: AppColors.logoColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              widget.review.name,
                              style: AppTextStyles.font18SemiBoldDarkGray900(context)
                                  .copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          horizontalSpace(4),
                          const Icon(
                            Icons.verified_rounded,
                            size: 15,
                            color: Color(0xFF0284C7),
                          ),
                        ],
                      ),
                      if (widget.review.role.isNotEmpty ||
                          widget.review.company.isNotEmpty)
                        Text(
                          [widget.review.role, widget.review.company]
                              .where((s) => s.isNotEmpty)
                              .join(' • '),
                          style: AppTextStyles.font16NormalDarkGray500(context)
                              .copyWith(
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
                if (widget.review.date.isNotEmpty)
                  Text(
                    widget.review.date,
                    style: TextStyle(
                      fontSize: 11,
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.35)
                          : Colors.black.withValues(alpha: 0.4),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
