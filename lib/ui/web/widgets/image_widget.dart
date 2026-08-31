import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:my_personal_portfolio/core/constants/app_assets.dart';
import '../../widgets/black_effect.dart';
import '/core/data/my_data.dart';
import '../../../core/themes/app_colors.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({super.key});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isHovered = false;

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
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutBack,
        child: SizedBox(
          width: 420,
          height: 420,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Outer Pulsating Glow
              AnimatedBuilder(
                animation: _controller,
                builder: (context, _) {
                  final pulse = (math.sin(_controller.value * 2 * math.pi) + 1) / 2;
                  return Container(
                    width: 360 + pulse * 25,
                    height: 360 + pulse * 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.logoColor.withValues(alpha: 0.15 + pulse * 0.15),
                          blurRadius: 40 + pulse * 20,
                          spreadRadius: 5 + pulse * 10,
                        ),
                        BoxShadow(
                          color: const Color(0xFF7C5CFF).withValues(alpha: 0.12 + pulse * 0.1),
                          blurRadius: 50,
                          spreadRadius: 2,
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
                      width: 375,
                      height: 375,
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
                        padding: const EdgeInsets.all(3.0),
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
                borderRadius: BorderRadius.circular(180),
                child: SizedBox(
                  width: 360,
                  height: 360,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        AppImages.background,
                        width: 360,
                        height: 360,
                        color: AppColors.logoColor.withValues(alpha: 0.7),
                        fit: BoxFit.cover,
                      ),
                      bBlackEffect(360, 360),
                      Positioned(
                        top: -10,
                        left: 0,
                        right: 0,
                        child: Image.network(
                          myData.profile,
                          width: 360,
                          height: 360,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.person, size: 100, color: Colors.white),
                        ),
                      ),
                      mBlackEffect(360, 360),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

