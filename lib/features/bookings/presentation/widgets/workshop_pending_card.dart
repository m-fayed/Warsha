import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class WorkshopPendingCard extends StatelessWidget {
  final String workshopName;
  final String serviceInfo;

  const WorkshopPendingCard({
    super.key,
    this.workshopName = 'Bmw Station',
    this.serviceInfo = 'Oil change . Bmw 320i',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFF7905).withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFFF7905).withValues(alpha: 0.3),
          width: 1.2,
        ),
      ),
      child: Row(
        children: [
          // Leading Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/BmwStation.png',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),

          // Details column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  workshopName,
                  style: const TextStyle(
                    color: AppColors.textDark,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  serviceInfo,
                  style: const TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 13,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ),

          // Trailing Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFFF7905).withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFFFF7905),
                width: 1,
              ),
            ),
            child: const Text(
              'Pending',
              style: TextStyle(
                color: Color(0xFFFF7905),
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
