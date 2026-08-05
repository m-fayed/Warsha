import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import 'package:warsha_app/core/utils/haptic_helper.dart';

/// Quick actions row displaying standard maintenance actions
class QuickActionsSection extends StatelessWidget {
  final VoidCallback onViewAll;
  final bool isSmallScreen;

  const QuickActionsSection({
    super.key,
    required this.onViewAll,
    required this.isSmallScreen,
  });

  @override
  Widget build(BuildContext context) {
    final actions = [
      {'title': 'Oil change', 'icon': 'assets/icons/oilChange.png'},
      {'title': 'Tire change', 'icon': 'assets/icons/tierChange.png'},
      {'title': 'Battery', 'icon': 'assets/icons/battary.png'},
      {'title': 'AC', 'icon': 'assets/icons/ac.png'},
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
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  HapticHelper.lightImpact();
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
                        act['title']!,
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