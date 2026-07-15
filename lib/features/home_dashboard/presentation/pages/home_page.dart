import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import 'package:warsha_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:warsha_app/features/home/presentation/bloc/home_event.dart';
import 'package:warsha_app/features/home_dashboard/presentation/pages/workshops_screen.dart';
import 'package:warsha_app/features/home_dashboard/presentation/cubit/workshops_filter_cubit.dart';
import 'package:warsha_app/features/profile/presentation/pages/profile_screen.dart';
import 'package:warsha_app/features/history/presentation/pages/car_history_screen.dart';
import 'package:warsha_app/features/reminders/presentation/pages/reminders_screen.dart';
import 'package:warsha_app/features/bookings/presentation/pages/my_bookings_screen.dart';
import 'package:warsha_app/features/home_dashboard/presentation/widgets/welcome_header_widget.dart';
import 'package:warsha_app/features/home_dashboard/presentation/widgets/live_car_status_card.dart';
import 'package:warsha_app/features/home_dashboard/presentation/widgets/custom_search_bar.dart';
import 'package:warsha_app/features/home_dashboard/presentation/widgets/quick_actions_section.dart';
import 'package:warsha_app/features/home_dashboard/presentation/widgets/recommended_section.dart';
import 'package:warsha_app/features/home_dashboard/presentation/widgets/grid_services_section.dart';
import 'package:warsha_app/features/home_dashboard/presentation/widgets/main_bottom_nav_bar.dart';

/// HomePage dashboard screen built according to strict UI & UX specifications.
class HomePage extends StatefulWidget {
  final int initialTab;
  const HomePage({super.key, this.initialTab = 0});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Favorite state for the recommended cards
  bool _isBmwStationFavorite = false;
  bool _isBmwClubFavorite = false;

  // Selected bottom navigation index
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialTab;
    context.read<HomeBloc>().add(const LoadFeaturedWorkshopsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 360;

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.darkBg
          : AppColors.lightBg,
      body: _currentIndex == 1
          ? const CarHistoryScreen()
          : _currentIndex == 2
          ? const MyBookingsScreen()
          : _currentIndex == 3
          ? const RemindersScreen()
          : _currentIndex == 4
          ? const ProfileScreen()
          : SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const WelcomeHeaderWidget(),
                      const SizedBox(height: 24),
                      const LiveCarStatusCard(),
                      const SizedBox(height: 20),
                      CustomSearchBar(
                        onSubmitted: (query) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  WorkshopsScreen(initialSearchQuery: query),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      QuickActionsSection(
                        onViewAll: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WorkshopsScreen(
                                initialFilter: WorkshopFilter.nearMe,
                              ),
                            ),
                          );
                        },
                        isSmallScreen: isSmallScreen,
                      ),
                      const SizedBox(height: 24),
                      RecommendedSection(
                        screenWidth: screenWidth,
                        isBmwStationFavorite: _isBmwStationFavorite,
                        isBmwClubFavorite: _isBmwClubFavorite,
                        onBmwStationFavoriteTap: () {
                          setState(() {
                            _isBmwStationFavorite = !_isBmwStationFavorite;
                          });
                        },
                        onBmwClubFavoriteTap: () {
                          setState(() {
                            _isBmwClubFavorite = !_isBmwClubFavorite;
                          });
                        },
                        onViewAll: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WorkshopsScreen(
                                initialFilter: WorkshopFilter.topRated,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      GridServicesSection(isSmallScreen: isSmallScreen),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
      bottomNavigationBar: MainBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
