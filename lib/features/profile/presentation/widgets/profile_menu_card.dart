import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

/// Profile menu card with icon, title, and optional trailing widget
class ProfileMenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const ProfileMenuCard({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300, width: 1.0),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.textDark, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.textDark,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            trailing ??
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.textGrey,
                  size: 20,
                ),
          ],
        ),
      ),
    );
  }
}