import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import 'package:warsha_app/features/profile/presentation/pages/notifications_screen.dart';

class NotificationBellWithBadge extends StatelessWidget {
  final int unreadCount;

  const NotificationBellWithBadge({super.key, this.unreadCount = 3});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NotificationsScreen(),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey.withValues(alpha: 0.3),
              width: 1.2,
            ),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints.tightFor(width: 24, height: 24),
                icon: Icon(
                  Icons.notifications_none,
                  size: 24,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : AppColors.textDark,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationsScreen(),
                    ),
                  );
                },
              ),
              if (unreadCount > 0)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF7905),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      unreadCount > 9 ? '9+' : '$unreadCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto',
                        height: 1,
                      ),
                    ),
                  ),
                )
              else
                const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}