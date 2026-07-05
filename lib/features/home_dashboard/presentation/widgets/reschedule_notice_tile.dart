import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class RescheduleNoticeTile extends StatelessWidget {
  final VoidCallback onTap;

  const RescheduleNoticeTile({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.primaryOrange,
            width: 1.2,
          ),
          color: AppColors.primaryOrange.withValues(alpha: 0.05),
        ),
        child: Row(
          children: [
            // Headset/Support Orange Icon
            const Icon(
              Icons.headset_mic_outlined,
              color: AppColors.primaryOrange,
              size: 24,
            ),
            const SizedBox(width: 14),
            // Text descriptor
            const Expanded(
              child: Text(
                'Need to change something? You can reschedule or cancel your booking',
                style: TextStyle(
                  color: AppColors.primaryOrange,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto',
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Chevron trailing icon
            const Icon(
              Icons.chevron_right,
              color: AppColors.primaryOrange,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
