import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class DottedLinePainter extends CustomPainter {
  final Color color;
  final double width;
  final double dashHeight;
  final double gap;

  DottedLinePainter({
    required this.color,
    this.width = 2,
    this.dashHeight = 4,
    this.gap = 4,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double startY = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, startY + dashHeight),
        paint,
      );
      startY += dashHeight + gap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class UrgentReminderTimelineItem extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final String description;
  final String overdueText;
  final String estimatedPrice;
  final VoidCallback onBookTap;
  final bool showLine;

  const UrgentReminderTimelineItem({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.description,
    required this.overdueText,
    required this.estimatedPrice,
    required this.onBookTap,
    this.showLine = true,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left side: Nested double circle timeline indicator & dotted line
          Column(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(
                      0xFFFF7905,
                    ).withValues(alpha: 0.3), // Soft orange outline
                    width: 4,
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFF7905), // Solid inner orange
                  ),
                  alignment: Alignment.center,
                  child: Icon(leadingIcon, color: Colors.white, size: 18),
                ),
              ),
              if (showLine)
                Expanded(
                  child: CustomPaint(
                    size: const Size(2, double.infinity),
                    painter: DottedLinePainter(
                      color: const Color(0xFFFF7905),
                      width: 2,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),

          // Right side: The Urgent Card
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(
                    0xFFFFF8F2,
                  ), // Light orange tinted background
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFFF7905), // Primary orange border
                    width: 1.2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top: Title and "Overdue" Badge
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              color: AppColors.textDark,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(
                              0xFFE53935,
                            ), // High-contrast Red/Orange Overdue badge
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            overdueText,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Alert description text
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors
                            .red
                            .shade800, // Safety warning indicator text
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Estimated price range
                    Text(
                      'Estimated: $estimatedPrice',
                      style: const TextStyle(
                        color: AppColors.textDark,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Bottom Row: "Book Service" button & Calendar icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Book Service button (Orange text button)
                        InkWell(
                          onTap: onBookTap,
                          child: const Text(
                            'Book Service',
                            style: TextStyle(
                              color: Color(0xFFFF7905),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),

                        // Calendar icon button (Orange outline box)
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xFFFF7905),
                              width: 1.2,
                            ),
                          ),
                          child: const Icon(
                            Icons.calendar_today_outlined,
                            color: Color(0xFFFF7905),
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
