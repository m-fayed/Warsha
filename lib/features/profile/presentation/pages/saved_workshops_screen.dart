import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import 'package:warsha_app/core/utils/haptic_helper.dart';
import 'package:warsha_app/features/home_dashboard/presentation/cubit/saved_workshops_cubit.dart';
import 'package:warsha_app/features/home_dashboard/presentation/pages/workshops_screen.dart';
import 'package:warsha_app/features/home_dashboard/presentation/widgets/workshop_list_item_card.dart';

/// Screen displaying the user's favorited / saved workshops
class SavedWorkshopsScreen extends StatelessWidget {
  const SavedWorkshopsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Saved Workshops',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.grey,
            size: 18,
          ),
          onPressed: () {
            HapticHelper.lightImpact();
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocBuilder<SavedWorkshopsCubit, SavedWorkshopsState>(
        builder: (context, state) {
          final savedList = state.savedWorkshops;

          if (savedList.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: const Color(0x1FFF7905),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFFF7905),
                          width: 1.2,
                        ),
                      ),
                      child: const Icon(
                        Icons.favorite_border_rounded,
                        color: Color(0xFFFF7905),
                        size: 44,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'No saved workshops yet',
                      style: TextStyle(
                        color: AppColors.textDark,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Workshops you favorite will appear here for quick access.',
                      style: TextStyle(
                        color: AppColors.textGrey,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          HapticHelper.lightImpact();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WorkshopsScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryOrange,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Explore Workshops',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            itemCount: savedList.length,
            itemBuilder: (context, index) {
              final workshop = savedList[index];
              return WorkshopListItemCard(
                name: workshop.name,
                logoPath: workshop.logoPath,
                specialty: workshop.specialty,
                rating: workshop.rating,
                logoBgColor: workshop.logoBgColor,
                distance: workshop.distance,
              );
            },
          );
        },
      ),
    );
  }
}
