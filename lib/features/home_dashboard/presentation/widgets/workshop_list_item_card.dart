import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import 'package:warsha_app/features/home_dashboard/presentation/pages/workshop_details_screen.dart';

/// Reusable Workshop List Item Card matching design specifications
class WorkshopListItemCard extends StatelessWidget {
  final String name;
  final String logoPath;
  final String specialty;
  final double rating;
  final Color logoBgColor;
  final String distance;

  const WorkshopListItemCard({
    super.key,
    required this.name,
    required this.logoPath,
    required this.specialty,
    required this.rating,
    required this.distance,
    this.logoBgColor = const Color(0xFF292929),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WorkshopDetailsScreen(
              name: name,
              logoPath: logoPath,
              specialty: specialty,
              rating: rating,
              distance: distance,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: AppColors.popupsGradient,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left: Workshop logo bounded inside a custom-sized rounded box with explicit backdrop color
            Container(
              width: 70,
              height: 70,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: logoBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  logoPath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.build,
                        color: Colors.white70,
                        size: 24,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Center/Right: Vertical details column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Workshop Title (White bold text)
                  Text(
                    name,
                    style: const TextStyle(
                      color: AppColors.textDark,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  // Specialty description text
                  Text(
                    specialty,
                    style: const TextStyle(
                      color: AppColors.textGrey,
                      fontSize: 12,
                      fontFamily: 'Roboto',
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  // Horizontal row of 5 Golden Star Icons followed by the rating numeric string
                  Row(
                    children: [
                      ...List.generate(5, (index) {
                        IconData iconData = Icons.star;
                        Color starColor = const Color(0xFFFFA000); // Gold
                        if (rating >= index + 1) {
                          iconData = Icons.star;
                        } else if (rating >= index + 0.1) {
                          iconData = Icons.star_half;
                        } else {
                          iconData = Icons.star_border;
                          starColor = Colors.grey.shade400; // Grey border for empty
                        }
                        return Icon(
                          iconData,
                          color: starColor,
                          size: 16,
                        );
                      }),
                      const SizedBox(width: 8),
                      Text(
                        rating.toStringAsFixed(1),
                        style: const TextStyle(
                          color: AppColors.textDark,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
