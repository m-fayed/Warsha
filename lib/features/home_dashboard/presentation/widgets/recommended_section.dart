import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import 'package:warsha_app/features/home_dashboard/presentation/widgets/workshop_card.dart';

/// Recommended workshops section with horizontal scrollable cards
class RecommendedSection extends StatelessWidget {
  final double screenWidth;
  final bool isBmwStationFavorite;
  final bool isBmwClubFavorite;
  final VoidCallback onBmwStationFavoriteTap;
  final VoidCallback onBmwClubFavoriteTap;
  final VoidCallback onViewAll;

  const RecommendedSection({
    super.key,
    required this.screenWidth,
    required this.isBmwStationFavorite,
    required this.isBmwClubFavorite,
    required this.onBmwStationFavoriteTap,
    required this.onBmwClubFavoriteTap,
    required this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recommended for you',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            GestureDetector(
              onTap: onViewAll,
              child: const Text(
                'View all >',
                style: TextStyle(
                  color: AppColors.primaryOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Horizontal workshop cards
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              WorkshopCard(
                title: 'Bmw Station',
                imagePath: 'assets/images/BmwStation.png',
                isFavorite: isBmwStationFavorite,
                favoriteColor: Colors.black,
                onFavoriteTap: onBmwStationFavoriteTap,
                width: screenWidth * 0.65,
                specialty: 'Specialized in Bmw and mini cooper',
                rating: 5.0,
                distance: '3.5 km',
              ),
              const SizedBox(width: 16),
              WorkshopCard(
                title: 'Bmw Club',
                imagePath: 'assets/images/BmwClub.png',
                isFavorite: isBmwClubFavorite,
                favoriteColor: Colors.red,
                onFavoriteTap: onBmwClubFavoriteTap,
                width: screenWidth * 0.65,
                specialty: 'Specialized in Bmw',
                rating: 4.5,
                distance: '3.5 km',
              ),
            ],
          ),
        ),
      ],
    );
  }
}