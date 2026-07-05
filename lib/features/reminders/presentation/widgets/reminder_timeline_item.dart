import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class ReminderTimelineItem extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final String dueDate;
  final String? estimatedPrice;
  final VoidCallback onBookTap;
  final bool showLine;

  const ReminderTimelineItem({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.dueDate,
    this.estimatedPrice,
    required this.onBookTap,
    this.showLine = true,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left side: Timeline graphics
          Column(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFFF7905),
                    width: 1.5,
                  ),
                ),
                child: Icon(
                  leadingIcon,
                  color: const Color(0xFFFF7905),
                  size: 22,
                ),
              ),
              if (showLine)
                Expanded(
                  child: Container(
                    width: 2,
                    color: const Color(0xFFFF7905),
                  ),
                ),
              if (showLine)
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFF7905),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),

          // Right side: The Card
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF8F2), // Light orange tinted background
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFFF7905), // Primary orange border
                    width: 1.2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top: Title and "Upcoming" badge
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
                            color: const Color(0xFFFF7905), // Orange badge
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Upcoming',
                            style: TextStyle(
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

                    // Due date text
                    Text(
                      dueDate,
                      style: const TextStyle(
                        color: AppColors.textGrey,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Estimated price (if provided)
                    if (estimatedPrice != null) ...[
                      Text(
                        'Estimated: $estimatedPrice',
                        style: const TextStyle(
                          color: AppColors.textDark,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],

                    const Spacer(),

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
