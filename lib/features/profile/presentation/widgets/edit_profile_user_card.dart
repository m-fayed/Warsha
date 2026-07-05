import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class EditProfileUserCard extends StatelessWidget {
  final String name;
  final String phone;

  const EditProfileUserCard({
    super.key,
    required this.name,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3E0), // Soft orange tinted background
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primaryOrange,
          width: 1.2,
        ),
      ),
      child: Row(
        children: [
          // Solid Orange square block hosting White centered 'S' text
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.primaryOrange,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'S',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // User info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: AppColors.textDark,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  phone,
                  style: const TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 14,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
