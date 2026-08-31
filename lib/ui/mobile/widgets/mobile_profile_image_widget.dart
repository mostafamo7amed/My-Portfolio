import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../core/constants/app_assets.dart';
import '../../widgets/black_effect.dart';
import '/core/data/my_data.dart';
import '../../../core/themes/app_colors.dart';

class MobileProfileImageWidget extends StatefulWidget {
  const MobileProfileImageWidget({super.key});

  @override
  State<MobileProfileImageWidget> createState() => _MobileProfileImageWidgetState();
}

class _MobileProfileImageWidgetState extends State<MobileProfileImageWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                final pulse = (math.sin(_controller.value * 2 * math.pi) + 1) / 2;
                return Container(
                  width: 250 + pulse * 20,
                  height: 250 + pulse * 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.logoColor.withValues(alpha: 0.2 + pulse * 0.15),
                        blurRadius: 35 + pulse * 15,
                        spreadRadius: 4 + pulse * 8,
                      ),
                      BoxShadow(
                        color: const Color(0xFF7C5CFF).withValues(alpha: 0.12 + pulse * 0.08),
                        blurRadius: 40,
                      ),
                    ],
                  ),
                );
              },
            ),

            // Rotating Gradient Ring
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: Container(
                    width: 265,
                    height: 265,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const SweepGradient(
                        colors: [
                          AppColors.logoColor,
                          Color(0xFF22D3EE),
                          Color(0xFF7C5CFF),
                          AppColors.logoColor,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.5),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.darkGray,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            // Profile container & background
            ClipRRect(
              borderRadius: BorderRadius.circular(130),
              child: SizedBox(
                width: 250,
                height: 250,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      AppImages.background,
                      width: 250,
                      height: 250,
                      color: AppColors.logoColor.withValues(alpha: 0.7),
                      fit: BoxFit.cover,
                    ),
                    bBlackEffect(250, 250),
                    Positioned(
                      top: -10,
                      left: 0,
                      right: 0,
                      child: Image.network(
                        myData.profile,
                        width: 250,
                        height: 250,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.person, size: 80, color: Colors.white),
                      ),
                    ),
                    mBlackEffect(250, 250),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

