import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import 'package:warsha_app/features/profile/presentation/widgets/notification_item_tile.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<_NotificationEntry> _notifications = [
    _NotificationEntry(
      title: 'Payment received successfully',
      subtitle:
          'Your last workshop invoice was settled and the receipt is now available in your history.',
      timestamp: '5m ago',
      type: _NotificationType.payment,
      isUnread: true,
    ),
    _NotificationEntry(
      title: 'Service progress updated',
      subtitle:
          'The workshop has moved your vehicle to the inspection stage and uploaded new progress notes.',
      timestamp: '2h ago',
      type: _NotificationType.service,
      isUnread: true,
    ),
    _NotificationEntry(
      title: 'Quote approved by mechanic',
      subtitle:
          'Your requested repair quote was approved and the team can continue with the next steps.',
      timestamp: 'Yesterday',
      type: _NotificationType.approval,
      isUnread: false,
    ),
    _NotificationEntry(
      title: 'Booking confirmed',
      subtitle:
          'Your service slot is confirmed for tomorrow at 10:30 AM with the selected workshop.',
      timestamp: '1d ago',
      type: _NotificationType.booking,
      isUnread: false,
    ),
    _NotificationEntry(
      title: 'Reminder: diagnostic report ready',
      subtitle:
          'A new diagnostic summary is available for review before you approve the next repair step.',
      timestamp: '3d ago',
      type: _NotificationType.reminder,
      isUnread: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final hasNotifications = _notifications.isNotEmpty;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: AppColors.textDark,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontFamily: 'Roboto',
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.textDark,
            size: 18,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TextButton(
              onPressed: hasNotifications ? _markAllAsRead : null,
              child: Text(
                'Mark all as read',
                style: TextStyle(
                  color: hasNotifications
                      ? AppColors.primaryOrange
                      : AppColors.textGrey,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFFFFF), Color(0xFFF7F7F7)],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -60,
              right: -30,
              child: _GlowBlob(
                color: AppColors.primaryOrange.withValues(alpha: 0.08),
                size: 180,
              ),
            ),
            Positioned(
              bottom: -70,
              left: -40,
              child: _GlowBlob(
                color: AppColors.primaryOrangeDark.withValues(alpha: 0.05),
                size: 220,
              ),
            ),
            SafeArea(
              child: hasNotifications
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                      itemCount: _notifications.length,
                      itemBuilder: (context, index) {
                        final notification = _notifications[index];
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: index == _notifications.length - 1 ? 0 : 12,
                          ),
                          child: NotificationItemTile(
                            title: notification.title,
                            subtitle: notification.subtitle,
                            timestamp: notification.timestamp,
                            icon: notification.icon,
                            iconBackgroundColor: notification.accentColor,
                            isUnread: notification.isUnread,
                            onTap: () => _markAsRead(index),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: _EmptyNotificationsState(),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _markAllAsRead() {
    if (_notifications.every((notification) => !notification.isUnread)) {
      return;
    }

    setState(() {
      for (final notification in _notifications) {
        notification.isUnread = false;
      }
    });
  }

  void _markAsRead(int index) {
    if (!_notifications[index].isUnread) {
      return;
    }

    setState(() {
      _notifications[index].isUnread = false;
    });
  }
}

class _NotificationEntry {
  final String title;
  final String subtitle;
  final String timestamp;
  final _NotificationType type;
  bool isUnread;

  _NotificationEntry({
    required this.title,
    required this.subtitle,
    required this.timestamp,
    required this.type,
    required this.isUnread,
  });

  IconData get icon {
    switch (type) {
      case _NotificationType.payment:
        return Icons.payment;
      case _NotificationType.service:
        return Icons.build;
      case _NotificationType.approval:
        return Icons.check_circle;
      case _NotificationType.booking:
        return Icons.event_available;
      case _NotificationType.reminder:
        return Icons.notifications_active;
    }
  }

  Color get accentColor {
    switch (type) {
      case _NotificationType.payment:
        return AppColors.primaryOrange;
      case _NotificationType.service:
        return AppColors.info;
      case _NotificationType.approval:
        return AppColors.success;
      case _NotificationType.booking:
        return AppColors.warning;
      case _NotificationType.reminder:
        return AppColors.primaryGold;
    }
  }
}

enum _NotificationType { payment, service, approval, booking, reminder }

class _GlowBlob extends StatelessWidget {
  final Color color;
  final double size;

  const _GlowBlob({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _EmptyNotificationsState extends StatelessWidget {
  const _EmptyNotificationsState();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 88,
          height: 88,
          decoration: BoxDecoration(
            color: AppColors.primaryOrange.withValues(alpha: 0.10),
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primaryOrange.withValues(alpha: 0.18),
            ),
          ),
          child: const Icon(
            Icons.notifications_none,
            color: AppColors.primaryOrange,
            size: 40,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'No notifications yet',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.textDark,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: 'Roboto',
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Updates from your bookings, payments, and workshop progress will appear here.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.textGrey,
            fontSize: 13,
            height: 1.5,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto',
          ),
        ),
      ],
    );
  }
}
