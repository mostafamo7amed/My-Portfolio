import 'dart:math' as math;
import 'package:flutter/material.dart';

/// A widget that floats smoothly up and down with optional rotation sway,
/// mimicking the @keyframes float & floatingIcons animation from the reference portfolio.
class FloatingIconWidget extends StatefulWidget {
  final Widget child;
  final double distance;
  final Duration duration;
  final double maxAngle;
  final Duration delay;
  final bool enableHoverScale;

  const FloatingIconWidget({
    super.key,
    required this.child,
    this.distance = 8.0,
    this.duration = const Duration(seconds: 4),
    this.maxAngle = 0.05,
    this.delay = Duration.zero,
    this.enableHoverScale = true,
  });

  @override
  State<FloatingIconWidget> createState() => _FloatingIconWidgetState();
}

class _FloatingIconWidgetState extends State<FloatingIconWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    if (widget.delay == Duration.zero) {
      _controller.repeat(reverse: true);
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) {
          _controller.repeat(reverse: true);
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        if (widget.enableHoverScale && mounted) {
          setState(() => _isHovered = true);
        }
      },
      onExit: (_) {
        if (widget.enableHoverScale && mounted) {
          setState(() => _isHovered = false);
        }
      },
      child: AnimatedScale(
        scale: _isHovered ? 1.15 : 1.0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutBack,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final offset = (math.sin(_animation.value * math.pi) - 0.5) * 2 * widget.distance;
            final angle = math.sin(_animation.value * 2 * math.pi) * widget.maxAngle;
            return Transform.translate(
              offset: Offset(0, offset),
              child: Transform.rotate(
                angle: angle,
                child: child,
              ),
            );
          },
          child: widget.child,
        ),
      ),
    );
  }
}
