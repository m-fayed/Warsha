import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class NewTotalGradientCard extends StatelessWidget {
  final int originalPrice;
  final int extraPrice;

  const NewTotalGradientCard({
    super.key,
    this.originalPrice = 550,
    this.extraPrice = 210,
  });

  @override
  Widget build(BuildContext context) {
    final int newTotal = originalPrice + extraPrice;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF2A1F22),
            Color(0xFF1A1416),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
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
                  'NEW TOTAL',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Original $originalPrice EGP + Extras $extraPrice EGP',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ),
          // Total orange price
          Text(
            '$newTotal EGP',
            style: const TextStyle(
              color: AppColors.primaryOrange,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
    );
  }
}
