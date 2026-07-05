import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class WorkshopCoreMetrics extends StatelessWidget {
  final String name;
  final double rating;
  final String distance;
  final String location;

  const WorkshopCoreMetrics({
    super.key,
    required this.name,
    required this.rating,
    required this.distance,
    this.location = 'Elrehab city, New cairo',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name & Orange verified badge row
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                name,
                style: const TextStyle(
                  color: AppColors.textDark,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 6),
            const Icon(Icons.verified, color: Colors.orange, size: 20),
          ],
        ),
        const SizedBox(height: 10),
        // Rating & Distance Row
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Color(0xFFFFA000), // Gold Star
              size: 18,
            ),
            const SizedBox(width: 4),
            Text(
              rating.toStringAsFixed(1),
              style: const TextStyle(
                color: AppColors.textDark,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(width: 16),
            Container(width: 1.5, height: 14, color: Colors.grey[300]),
            const SizedBox(width: 16),
            Text(
              distance,
              style: const TextStyle(
                color: AppColors.textGrey,
                fontSize: 14,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Location row with pin icon
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: AppColors.primaryOrange,
              size: 18,
            ),
            const SizedBox(width: 6),
            Text(
              location,
              style: const TextStyle(
                color: AppColors.textGrey,
                fontSize: 13,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
