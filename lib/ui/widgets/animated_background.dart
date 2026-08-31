import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../core/themes/app_colors.dart';

class Particle {
  double x;
  double y;
  double vx;
  double vy;
  double radius;
  double alpha;
  Color color;

  Particle({
    required this.x,
    required this.y,
    required this.vx,
    required this.vy,
    required this.radius,
    required this.alpha,
    required this.color,
  });
}

class AnimatedBackground extends StatefulWidget {
  final Widget child;

  const AnimatedBackground({super.key, required this.child});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Particle> _particles = [];
  final math.Random _random = math.Random();
  Offset? _mousePosition;
  Size _lastSize = Size.zero;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  void _initParticles(Size size, bool isLight) {
    if (size.width <= 0 || size.height <= 0) return;
    _particles.clear();
    final int particleCount = (size.width < 700) ? 30 : 55;

    final List<Color> palette = isLight
        ? [
            AppColors.logoColor,
            const Color(0xFF6366F1), // Indigo
            const Color(0xFF0284C7), // Sky blue
            const Color(0xFF10B981), // Emerald
          ]
        : [
            AppColors.logoColor,
            const Color(0xFF7C5CFF), // Violet/Purple
            const Color(0xFF22D3EE), // Cyan/Accent
            Colors.white,
          ];

    for (int i = 0; i < particleCount; i++) {
      _particles.add(
        Particle(
          x: _random.nextDouble() * size.width,
          y: _random.nextDouble() * size.height,
          vx: (_random.nextDouble() - 0.5) * 0.6,
          vy: (_random.nextDouble() - 0.5) * 0.6,
          radius: _random.nextDouble() * 2.0 + 1.2,
          alpha: isLight
              ? _random.nextDouble() * 0.45 + 0.25
              : _random.nextDouble() * 0.4 + 0.15,
          color: palette[_random.nextInt(palette.length)],
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    return LayoutBuilder(
      builder: (context, constraints) {
        final currentSize = Size(constraints.maxWidth, constraints.maxHeight);
        if (_particles.isEmpty || _lastSize != currentSize) {
          _lastSize = currentSize;
          _initParticles(currentSize, isLight);
        }

        return MouseRegion(
          onHover: (event) {
            setState(() {
              _mousePosition = event.localPosition;
            });
          },
          onExit: (_) {
            setState(() {
              _mousePosition = null;
            });
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Adaptive background base
              Container(
                color: isLight ? AppColors.lightBg : AppColors.darkBg,
              ),

              // Animated Radial Glows and Particles
              AnimatedBuilder(
                animation: _controller,
                builder: (context, _) {
                  return CustomPaint(
                    size: currentSize,
                    painter: _BackgroundPainter(
                      progress: _controller.value,
                      particles: _particles,
                      mousePos: _mousePosition,
                      isLight: isLight,
                    ),
                  );
                },
              ),

              // Content layer
              widget.child,
            ],
          ),
        );
      },
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  final double progress;
  final List<Particle> particles;
  final Offset? mousePos;
  final bool isLight;

  _BackgroundPainter({
    required this.progress,
    required this.particles,
    this.mousePos,
    required this.isLight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;

    // 1. Draw Ambient Radial Glow Orbs (Aurora Effect)
    _drawAmbientGlows(canvas, size);

    // 2. Draw and update particles
    _drawParticles(canvas, size);
  }

  void _drawAmbientGlows(Canvas canvas, Size size) {
    final double time = progress * 2 * math.pi;

    // Orb 1: Top-Left Primary (Logo Color / Coral)
    final double x1 = size.width * (0.2 + 0.05 * math.sin(time));
    final double y1 = size.height * (0.15 + 0.05 * math.cos(time));
    final paint1 = Paint()
      ..shader = RadialGradient(
        colors: [
          AppColors.logoColor.withValues(alpha: isLight ? 0.10 : 0.14),
          AppColors.logoColor.withValues(alpha: isLight ? 0.03 : 0.04),
          Colors.transparent,
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(
        Rect.fromCircle(
          center: Offset(x1, y1),
          radius: math.max(size.width, size.height) * 0.45,
        ),
      );
    canvas.drawCircle(Offset(x1, y1), math.max(size.width, size.height) * 0.45, paint1);

    // Orb 2: Top-Right / Center Cyan & Blue Glow
    final double x2 = size.width * (0.8 - 0.08 * math.cos(time * 0.8));
    final double y2 = size.height * (0.25 + 0.06 * math.sin(time * 0.8));
    final paint2 = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFF22D3EE).withValues(alpha: isLight ? 0.09 : 0.11),
          const Color(0xFF7C5CFF).withValues(alpha: isLight ? 0.03 : 0.04),
          Colors.transparent,
        ],
        stops: const [0.0, 0.55, 1.0],
      ).createShader(
        Rect.fromCircle(
          center: Offset(x2, y2),
          radius: math.max(size.width, size.height) * 0.4,
        ),
      );
    canvas.drawCircle(Offset(x2, y2), math.max(size.width, size.height) * 0.4, paint2);

    // Orb 3: Bottom Center Purple Aura
    final double x3 = size.width * (0.5 + 0.07 * math.sin(time * 1.2));
    final double y3 = size.height * (0.75 + 0.05 * math.cos(time * 1.2));
    final paint3 = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFF7C5CFF).withValues(alpha: isLight ? 0.08 : 0.10),
          Colors.transparent,
        ],
        stops: const [0.0, 1.0],
      ).createShader(
        Rect.fromCircle(
          center: Offset(x3, y3),
          radius: math.max(size.width, size.height) * 0.35,
        ),
      );
    canvas.drawCircle(Offset(x3, y3), math.max(size.width, size.height) * 0.35, paint3);
  }

  void _drawParticles(Canvas canvas, Size size) {
    final particlePaint = Paint()..style = PaintingStyle.fill;
    final linePaint = Paint()
      ..strokeWidth = 0.6
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < particles.length; i++) {
      final p = particles[i];

      // Update position
      p.x += p.vx;
      p.y += p.vy;

      // Bounce off walls
      if (p.x < 0 || p.x > size.width) p.vx *= -1;
      if (p.y < 0 || p.y > size.height) p.vy *= -1;

      // Mouse interactive repelling
      if (mousePos != null) {
        final dx = mousePos!.dx - p.x;
        final dy = mousePos!.dy - p.y;
        final dist = math.sqrt(dx * dx + dy * dy);
        if (dist < 120 && dist > 0) {
          final force = (120 - dist) / 120;
          p.x -= (dx / dist) * force * 1.5;
          p.y -= (dy / dist) * force * 1.5;
        }
      }

      // Draw particle circle with glow
      particlePaint.color = p.color.withValues(alpha: p.alpha);
      canvas.drawCircle(Offset(p.x, p.y), p.radius, particlePaint);

      // Connect near particles with delicate lines
      for (int j = i + 1; j < particles.length; j++) {
        final p2 = particles[j];
        final dx = p.x - p2.x;
        final dy = p.y - p2.y;
        final distance = math.sqrt(dx * dx + dy * dy);

        if (distance < 90) {
          final lineAlpha = (1.0 - (distance / 90)) * (isLight ? 0.20 : 0.15);
          linePaint.color = p.color.withValues(alpha: lineAlpha);
          canvas.drawLine(Offset(p.x, p.y), Offset(p2.x, p2.y), linePaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _BackgroundPainter oldDelegate) => true;
}
