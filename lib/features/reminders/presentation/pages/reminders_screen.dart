import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import 'package:warsha_app/features/profile/presentation/widgets/notification_bell_with_badge.dart';
import '../widgets/reminder_timeline_item.dart';
import '../widgets/urgent_reminder_timeline_item.dart';
import '../widgets/reminder_filter_tabs.dart';

class RemindersScreen extends StatefulWidget {
  const RemindersScreen({super.key});

  @override
  State<RemindersScreen> createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
  int _activeTab = 0; // 0: Upcoming, 1: Urgent, 2: Completed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Top Header with Title and Custom Reusable Notification Bell
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Reminders',
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  
                  // رشقنا الجرس الموحد والذكي بالـ Badge بتاعه هنا
                  const NotificationBellWithBadge(),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                'Stay ahead. Avoid costly repairs.',
                style: TextStyle(
                  color: AppColors.textGrey,
                  fontSize: 14,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 24),

              // 2. Custom Horizontal Tabs Row
              ReminderFilterTabs(
                activeTab: _activeTab,
                onTabChanged: (index) => setState(() => _activeTab = index),
              ),
              const SizedBox(height: 24),

              // 3. Scrollable Timeline List View
              Expanded(
                child: _activeTab == 0
                    ? _buildUpcomingTimeline()
                    : _activeTab == 1
                        ? _buildUrgentTimeline()
                        : _buildCompletedPlaceholder(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUpcomingTimeline() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        ReminderTimelineItem(
          leadingIcon: Icons.battery_charging_full_outlined,
          title: 'Battery Check',
          dueDate: 'Due in 2 months',
          estimatedPrice: '1,200 - 1,800 EGP',
          onBookTap: () => _showBookingNotice('Battery Check'),
        ),
        ReminderTimelineItem(
          leadingIcon: Icons.oil_barrel_outlined,
          title: 'Oil Change',
          dueDate: 'Due in 12 Days . 2,150 km',
          onBookTap: () => _showBookingNotice('Oil Change'),
        ),
        ReminderTimelineItem(
          leadingIcon: Icons.oil_barrel_outlined,
          title: 'Oil Change',
          dueDate: 'Due in 12 Days . 2,150 km',
          showLine: false,
          onBookTap: () => _showBookingNotice('Oil Change'),
        ),
      ],
    );
  }

  Widget _buildUrgentTimeline() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        UrgentReminderTimelineItem(
          leadingIcon: Icons.warning_amber_rounded,
          title: 'Brake Inspection',
          description: 'Brake pads are worn down to 3mm. Critical safety risk.',
          overdueText: 'Overdue by 5 days',
          estimatedPrice: '450 - 650 EGP',
          showLine: false,
          onBookTap: () => _showBookingNotice('Brake Inspection'),
        ),
      ],
    );
  }

  Widget _buildCompletedPlaceholder() {
    return const Center(
      child: Text(
        'No completed reminders yet.',
        style: TextStyle(
          color: AppColors.textGrey,
          fontSize: 14,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }

  void _showBookingNotice(String serviceName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Booking $serviceName...')),
    );
  }
}