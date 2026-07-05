import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class ProfileHeaderCard extends StatelessWidget {
  final VoidCallback onTap;

  const ProfileHeaderCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF3E0), // درجة البرتقالي الخفيف
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primaryOrange, width: 1.2),
        ),
        child: Row(
          children: [
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
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Seif Fawzy', style: TextStyle(color: AppColors.textDark, fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('+201111519944', style: TextStyle(color: AppColors.textGrey, fontSize: 14)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.primaryOrange, size: 24),
          ],
        ),
      ),
    );
  }
}