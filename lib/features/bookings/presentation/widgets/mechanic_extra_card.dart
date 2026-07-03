import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;
  final double dashLength;
  final double borderRadius;

  DashedBorderPainter({
    required this.color,
    this.strokeWidth = 1.2,
    this.gap = 4.0,
    this.dashLength = 6.0,
    this.borderRadius = 16.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final RRect rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    );

    final Path path = Path()..addRRect(rrect);
    final Path dashedPath = Path();

    for (final PathMetric metric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        dashedPath.addPath(
          metric.extractPath(distance, distance + dashLength),
          Offset.zero,
        );
        distance += dashLength + gap;
      }
    }
    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(covariant DashedBorderPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

class MechanicExtraCard extends StatelessWidget {
  final int airFilterPrice;
  final int oilFilterPrice;
  final bool isDashed;

  const MechanicExtraCard({
    super.key,
    this.airFilterPrice = 90,
    this.oilFilterPrice = 120,
    this.isDashed = true,
  });

  @override
  Widget build(BuildContext context) {
    final int extraTotal = airFilterPrice + oilFilterPrice;

    return CustomPaint(
      painter: isDashed
          ? DashedBorderPainter(
              color: const Color(0xFFFF7905).withValues(alpha: 0.5),
            )
          : null,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFFF7905).withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(16),
          border: isDashed
              ? null
              : Border.all(
                  color: const Color(0xFFFF7905).withValues(alpha: 0.3),
                  width: 1.2,
                ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mechanic Recommendation',
              style: TextStyle(
                color: AppColors.textDark,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 12),
            _buildItemRow(
              Icons.filter_alt_outlined,
              'Air Filter',
              'Clogged with dust, effects fuel economy',
              '+$airFilterPrice EGP',
            ),
            const SizedBox(height: 12),
            _buildItemRow(
              Icons.oil_barrel_outlined,
              'Oil filter',
              'Old one is worn, replacement recommended',
              '+$oilFilterPrice EGP',
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(color: Colors.black12, height: 1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Extra cost',
                  style: TextStyle(
                    color: Color(0xFFFF7905),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
                Text(
                  '+$extraTotal EGP',
                  style: const TextStyle(
                    color: Color(0xFFFF7905),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemRow(
    IconData icon,
    String title,
    String? subtitle,
    String price,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Icon(
            icon,
            color: AppColors.textGrey,
            size: 18,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textDark,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 11,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ],
          ),
        ),
        Text(
          price,
          style: const TextStyle(
            color: AppColors.textDark,
            fontSize: 13,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
      ],
    );
  }
}
