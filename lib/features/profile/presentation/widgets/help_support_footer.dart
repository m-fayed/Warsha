import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class HelpSupportFooter extends StatelessWidget {
  const HelpSupportFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Can’t find what you need",
            style: TextStyle(
              color: AppColors.primaryOrange.withValues(alpha: 0.8),
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "Contact our team",
            style: TextStyle(
              color: AppColors.primaryOrange,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
    );
  }
}
