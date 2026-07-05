import 'package:flutter/material.dart';
import '../widgets/workshop_hero_section.dart';
import '../widgets/workshop_core_metrics.dart';
import '../widgets/workshop_about_section.dart';
import '../widgets/workshop_services_section.dart';
import '../widgets/workshop_book_now_button.dart';

/// Workshop Details Screen rendering profile data dynamically.
class WorkshopDetailsScreen extends StatefulWidget {
  final String name;
  final String logoPath;
  final String specialty;
  final double rating;
  final String distance;

  const WorkshopDetailsScreen({
    super.key,
    required this.name,
    required this.logoPath,
    required this.specialty,
    required this.rating,
    required this.distance,
  });

  @override
  State<WorkshopDetailsScreen> createState() => _WorkshopDetailsScreenState();
}

class _WorkshopDetailsScreenState extends State<WorkshopDetailsScreen> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Scrollable main content area
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1 & 2. TOP ACTION BAR (Overlaid Layout) & PREMIUM HERO BANNER
                  WorkshopHeroSection(
                    name: widget.name,
                    logoPath: widget.logoPath,
                    isFavorite: _isFavorite,
                    onFavoriteToggled: (val) {
                      setState(() {
                        _isFavorite = val;
                      });
                    },
                  ),

                  // Content Details Padding
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 16.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 3. WORKSHOP CORE METRICS SECTION
                        WorkshopCoreMetrics(
                          name: widget.name,
                          rating: widget.rating,
                          distance: widget.distance,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Divider(
                            color: Colors.grey.shade300,
                            thickness: 1,
                          ),
                        ),

                        // 4. PROFILE DETAIL TEXT BLOCKS - About
                        WorkshopAboutSection(name: widget.name),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Divider(
                            color: Colors.grey.shade300,
                            thickness: 1,
                          ),
                        ),

                        // 4. PROFILE DETAIL TEXT BLOCKS - Services
                        const WorkshopServicesSection(),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 5. PERSISTENT LOWER CALL TO ACTION BUTTON
          WorkshopBookNowButton(name: widget.name),
        ],
      ),
    );
  }
}
