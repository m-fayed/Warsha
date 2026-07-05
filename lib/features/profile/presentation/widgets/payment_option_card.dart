import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class PaymentOptionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const PaymentOptionCard({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.primaryOrange, // Vibrant Orange border
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Left: Mint Green square container holding the icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9), // Mint Green background
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: const Color(0xFF2E7D32),
                  size: 24,
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Content Text: Bold, scaled-up black text next to icon
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.textDark,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
