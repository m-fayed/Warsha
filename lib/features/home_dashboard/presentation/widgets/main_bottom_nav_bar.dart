import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

/// Main bottom navigation bar with 5 tabs (Home, History, Bookings, Reminders, Profile)
class MainBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const MainBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(height: 1, thickness: 1, color: Color(0xFFE0E0E0)),
        BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryOrange,
          unselectedItemColor: AppColors.textGrey,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontFamily: 'Roboto',
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home, color: AppColors.primaryOrange),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_outlined),
              activeIcon: Icon(Icons.history, color: AppColors.primaryOrange),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              activeIcon: Icon(
                Icons.calendar_today,
                color: AppColors.primaryOrange,
              ),
              label: 'Bookings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm_add_outlined),
              activeIcon: Icon(
                Icons.alarm_add,
                color: AppColors.primaryOrange,
              ),
              label: 'Reminders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person, color: AppColors.primaryOrange),
              label: 'Profile',
            ),
          ],
        ),
      ],
    );
  }
}