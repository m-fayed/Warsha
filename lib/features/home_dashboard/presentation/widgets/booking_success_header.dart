import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class BookingSuccessHeader extends StatefulWidget {
  const BookingSuccessHeader({super.key});

  @override
  State<BookingSuccessHeader> createState() => _BookingSuccessHeaderState();
}

class _BookingSuccessHeaderState extends State<BookingSuccessHeader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _distanceAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeOutBack)),
        weight: 50.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.0,
          end: 0.8,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50.0,
      ),
    ]).animate(_controller);

    _distanceAnimation = Tween<double>(
      begin: 20.0,
      end: 65.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildSparkleDot(
    Color color,
    double angleDegrees,
    double finalDistance,
    double size,
  ) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final angleRad = angleDegrees * math.pi / 180.0;
        final currentDistance = _distanceAnimation.value / 65.0 * finalDistance;
        final currentScale = _scaleAnimation.value;
        final dx = math.cos(angleRad) * currentDistance;
        final dy = math.sin(angleRad) * currentDistance;

        return Transform.translate(
          offset: Offset(dx, dy),
          child: Transform.scale(
            scale: currentScale,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha: 0.4),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        // Confetti stack around success checkmark
        SizedBox(
          width: 160,
          height: 160,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Checkmark icon center
              Image.asset(
                'assets/icons/confirm.png',
                width: 80,
                height: 80,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E9), // Mint green circle
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF2E7D32),
                        width: 3,
                      ),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Color(0xFF2E7D32),
                      size: 48,
                    ),
                  );
                },
              ),
              // Sparkles / Confetti Dots
              _buildSparkleDot(const Color(0xFF2ECC71), -135, 70, 7),
              _buildSparkleDot(const Color(0xFFFF7905), -45, 72, 8),
              _buildSparkleDot(const Color(0xFFFF7905), -165, 75, 5),
              _buildSparkleDot(const Color(0xFF2ECC71), -15, 75, 6),
              _buildSparkleDot(const Color(0xFF2ECC71), 135, 68, 8),
              _buildSparkleDot(const Color(0xFFFF7905), 45, 68, 7),
              _buildSparkleDot(const Color(0xFFFF7905), -105, 74, 5),
              _buildSparkleDot(const Color(0xFF2ECC71), -75, 74, 8),
              _buildSparkleDot(const Color(0xFF2ECC71), -150, 78, 8),
              _buildSparkleDot(const Color(0xFFFF7905), -30, 78, 7),
              _buildSparkleDot(const Color(0xFFFF7905), 105, 72, 5),
              _buildSparkleDot(const Color(0xFF2ECC71), 75, 72, 8),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Booking confirmed',
          style: TextStyle(
            color: Colors.black, // Dark title
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Your service has been successfully booked',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black54, // Muted dark subtitle
            fontSize: 14,
            fontFamily: 'Roboto',
          ),
        ),
        const SizedBox(height: 16),
        Divider(
          color: Colors.grey.shade300, // Light divider for white background
          thickness: 1,
        ),
      ],
    );
  }
}
