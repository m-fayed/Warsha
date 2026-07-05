import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class NotificationItemTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String timestamp;
  final IconData icon;
  final Color iconBackgroundColor;
  final bool isUnread;
  final VoidCallback? onTap;

  const NotificationItemTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.timestamp,
    required this.icon,
    required this.iconBackgroundColor,
    required this.isUnread,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isUnread ? const Color(0xFFFFF7F1) : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: isUnread
                  ? AppColors.primaryOrange.withValues(alpha: 0.22)
                  : Colors.grey.shade300,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: iconBackgroundColor.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconBackgroundColor, size: 24),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              color: AppColors.textDark,
                              fontSize: 15.5,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Roboto',
                              height: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              timestamp,
                              style: const TextStyle(
                                color: AppColors.textGrey,
                                fontSize: 11.5,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            const SizedBox(height: 6),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: isUnread ? 8 : 0,
                              height: isUnread ? 8 : 0,
                              decoration: const BoxDecoration(
                                color: AppColors.primaryOrange,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: AppColors.textGrey,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
