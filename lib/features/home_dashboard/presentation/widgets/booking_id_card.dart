import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class BookingIdCard extends StatelessWidget {
  final String bookingId;
  final String dateTimeText;

  const BookingIdCard({
    super.key,
    this.bookingId = 'WRSH-240512-718',
    this.dateTimeText = 'Tuesday, 14 May 2026, 10:00 AM',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0x1FFF7905), // Figma Hex #FF79051F
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFFF7905),
          width: 1.0,
        ), // Orange border
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Booking ID',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  bookingId,
                  style: const TextStyle(
                    color: AppColors.primaryOrange,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  dateTimeText,
                  style: const TextStyle(
                    color: AppColors.textGrey, // Dark text color for contrast
                    fontSize: 13,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ),
          // Confirmed badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF00B55B), // Figma Green
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Confirmed',
              style: TextStyle(
                color: Colors.white, // Solid white text
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
