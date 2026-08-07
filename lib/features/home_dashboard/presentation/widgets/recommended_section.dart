import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import 'package:warsha_app/core/utils/haptic_helper.dart';
import 'package:warsha_app/features/home_dashboard/presentation/cubit/saved_workshops_cubit.dart';
import 'package:warsha_app/features/home_dashboard/presentation/cubit/workshops_filter_cubit.dart';
import 'package:warsha_app/features/home_dashboard/presentation/widgets/workshop_card.dart';

/// Recommended workshops section with horizontal scrollable cards bound to SavedWorkshopsCubit
class RecommendedSection extends StatelessWidget {
  final double screenWidth;
  final VoidCallback onViewAll;

  const RecommendedSection({
    super.key,
    required this.screenWidth,
    required this.onViewAll,
    bool? isBmwStationFavorite,
    bool? isBmwClubFavorite,
    VoidCallback? onBmwStationFavoriteTap,
    VoidCallback? onBmwClubFavoriteTap,
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
        // Horizontal workshop cards with dynamic favorite state from Cubit
        BlocBuilder<SavedWorkshopsCubit, SavedWorkshopsState>(
          builder: (context, state) {
            final cubit = context.read<SavedWorkshopsCubit>();

            const bmwStationModel = WorkshopListItemModel(
              name: 'Bmw Station',
              logoPath: 'assets/images/BmwStation.png',
              specialty: 'Specialized in Bmw and mini cooper',
              rating: 5.0,
              logoBgColor: Color(0xFFFFD54F),
              distance: '3.5 km',
            );

            const bmwClubModel = WorkshopListItemModel(
              name: 'Bmw Club',
              logoPath: 'assets/images/BmwClub.png',
              specialty: 'Specialized in Bmw',
              rating: 4.5,
              logoBgColor: Color(0xFF292929),
              distance: '3.5 km',
            );

            final isBmwStationFav = state.isFavorite(bmwStationModel.name);
            final isBmwClubFav = state.isFavorite(bmwClubModel.name);

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Row(
                children: [
                  WorkshopCard(
                    title: bmwStationModel.name,
                    imagePath: bmwStationModel.logoPath,
                    isFavorite: isBmwStationFav,
                    favoriteColor: const Color(0xFFE53935),
                    onFavoriteTap: () {
                      HapticHelper.lightImpact();
                      cubit.toggleFavorite(bmwStationModel);
                    },
                    width: screenWidth * 0.65,
                    specialty: bmwStationModel.specialty,
                    rating: bmwStationModel.rating,
                    distance: bmwStationModel.distance,
                  ),
                  const SizedBox(width: 16),
                  WorkshopCard(
                    title: bmwClubModel.name,
                    imagePath: bmwClubModel.logoPath,
                    isFavorite: isBmwClubFav,
                    favoriteColor: const Color(0xFFE53935),
                    onFavoriteTap: () {
                      HapticHelper.lightImpact();
                      cubit.toggleFavorite(bmwClubModel);
                    },
                    width: screenWidth * 0.65,
                    specialty: bmwClubModel.specialty,
                    rating: bmwClubModel.rating,
                    distance: bmwClubModel.distance,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}