import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

/// Live car status card displaying vehicle range, health, and next service
class LiveCarStatusCard extends StatelessWidget {
  const LiveCarStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color(
              0xFFE6E6E6,
            ), // Blended bottom color (#FFFFFF + 20% dark overlay)
            Color(0xFFCC6104), // Blended top color (#FF7905 + 20% dark overlay)
          ],
          stops: [0.25, 1.0],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left side: BMW car image placeholder
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                aspectRatio: 1.2,
                child: Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/car.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.directions_car,
                          color: AppColors.textGrey,
                          size: 40,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Right side: Live status, Gradient Progress Bar, Ranges
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Live car status',
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 8),
                // Horizontal progress bar indicator (gradient from orange to green)
                Container(
                  height: 6,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: FractionallySizedBox(
                      widthFactor: 0.7, // 70% complete indicator
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          gradient: const LinearGradient(
                            colors: [
                              AppColors.primaryOrange,
                              Color(0xFF4CAF50), // Gradient green accent
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Car range: 137,000km',
                  style: TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 12,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Car health status: Good',
                  style: TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 12,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Next service: Oil change in 3,000km',
                  style: TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 11,
                    fontFamily: 'Roboto',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
