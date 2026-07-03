import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class OriginalBookingCard extends StatelessWidget {
  final int basePrice;
  final int serviceFee;

  const OriginalBookingCard({
    super.key,
    this.basePrice = 450,
    this.serviceFee = 100,
  });

  @override
  Widget build(BuildContext context) {
    final int total = basePrice + serviceFee;
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Original Booking',
            style: TextStyle(
              color: AppColors.textDark,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          const SizedBox(height: 12),
          _buildRow('Mobile 10k 5w-30', '$basePrice EGP'),
          const SizedBox(height: 8),
          _buildRow('Service Fee', '$serviceFee EGP'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Divider(color: Colors.black12, height: 1),
          ),
          _buildRow('Original total', '$total EGP', isTotal: true),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isTotal ? AppColors.textDark : AppColors.textGrey,
            fontSize: isTotal ? 14 : 13,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            fontFamily: 'Roboto',
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: AppColors.textDark,
            fontSize: isTotal ? 14 : 13,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
      ],
    );
  }
}
