import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import 'package:warsha_app/core/theme/app_text_styles.dart';
import 'package:warsha_app/features/profile/presentation/widgets/notification_bell_with_badge.dart';

/// Welcome header section with Warsha branding and notification bell
class WelcomeHeaderWidget extends StatelessWidget {
  const WelcomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // الجزء الشمال: فيه اسم التطبيق والترحيب تحت بعض
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Warsha',
              style: TextStyle(
                color: AppColors.primaryOrange,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Good morning, Seif 👋',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textGrey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        
        // الجزء اليمين: زرار الجرس الذكي الموحد بالكونتر بتاعه
        const NotificationBellWithBadge(),
      ],
    );
  }
}