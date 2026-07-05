import 'package:flutter/material.dart';

class BookingSuccessHeader extends StatelessWidget {
  const BookingSuccessHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        // Success image or fallback icon
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
        Text(
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
