import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import 'package:warsha_app/core/utils/haptic_helper.dart';
import 'package:warsha_app/features/home_dashboard/presentation/pages/book_service_screen.dart';

/// Quick actions row displaying standard maintenance actions (Oil change, Tire change, Battery, AC)
class QuickActionsSection extends StatelessWidget {
  final VoidCallback onViewAll;
  final bool isSmallScreen;
  final Function(String serviceName)? onQuickActionTap;

  const QuickActionsSection({
    super.key,
    required this.onViewAll,
    required this.isSmallScreen,
    this.onQuickActionTap,
  });

  @override
  Widget build(BuildContext context) {
    final actions = [
      {'title': 'Oil change', 'icon': 'assets/icons/oil.png'},
      {'title': 'Tire change', 'icon': 'assets/icons/tire.png'},
      {'title': 'Battery', 'icon': 'assets/icons/battery.png'},
      {'title': 'AC', 'icon': 'assets/icons/Ac.png'},
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Quick Actions',
              style: TextStyle(
                color: AppColors.textDark,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            GestureDetector(
              onTap: () {
                HapticHelper.lightImpact();
                onViewAll();
              },
              child: const Text(
                'View All',
                style: TextStyle(
                  color: AppColors.primaryOrange,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: actions.map((act) {
            final serviceTitle = act['title']!;

            return Expanded(
              child: GestureDetector(
                onTap: () {
                  HapticHelper.lightImpact();
                  if (onQuickActionTap != null) {
                    onQuickActionTap!(serviceTitle);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookServiceScreen(
                          workshopName: 'Bmw Station',
                          initialServiceName: serviceTitle,
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  padding: const EdgeInsets.symmetric(
                    vertical: 14.0,
                    horizontal: 4.0,
                  ),
                  decoration: AppColors.orangeWhiteGradient,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        act['icon']!,
                        height: 28,
                        width: 28,
                        fit: BoxFit.contain,
                        color: Colors.black,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.build_circle,
                            color: Colors.black,
                            size: 28,
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      Text(
                        serviceTitle,
                        style: TextStyle(
                          color: AppColors.textDark,
                          fontSize: isSmallScreen ? 9 : 11,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto',
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
