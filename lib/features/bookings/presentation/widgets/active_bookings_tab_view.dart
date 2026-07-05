import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import 'live_progress_card.dart';
import 'booking_status_card.dart';

class ActiveBookingsTabView extends StatelessWidget {
  final Function(String) onActionTriggered;

  const ActiveBookingsTabView({
    super.key,
    required this.onActionTriggered,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        // Live Progress Card
        LiveProgressCard(
          carInfo: 'BMW 320i • 2019',
          currentStep: 1,
          onApproveQuote: () => onActionTriggered('Quote Approved!'),
          onChatTap: () => onActionTriggered('Opening Chat...'),
          onCallTap: () => onActionTriggered('Calling Workshop...'),
        ),
        const SizedBox(height: 16),

        // Card 1: Confirmed status Brake Inspection
        BookingStatusCard(
          statusText: 'Confirmed',
          statusTextColor: const Color(0xFFFF7905),
          statusBgColor: const Color(0xFFFF7905).withValues(alpha: 0.12),
          statusBorderColor: const Color(0xFFFF7905),
          title: 'Brake Inspection',
          workshopName: "At bimmer's Egypt",
          showDetailsDivider: true,
          detailsRow: const Row(
            children: [
              Icon(Icons.calendar_today_outlined, size: 14, color: AppColors.textGrey),
              SizedBox(width: 4),
              Text(
                'Tue, 14 May',
                style: TextStyle(fontSize: 12, color: AppColors.textGrey, fontFamily: 'Roboto'),
              ),
              SizedBox(width: 14),
              Icon(Icons.access_time, size: 14, color: AppColors.textGrey),
              SizedBox(width: 4),
              Text(
                '2:30 PM',
                style: TextStyle(fontSize: 12, color: AppColors.textGrey, fontFamily: 'Roboto'),
              ),
              SizedBox(width: 14),
              Icon(Icons.location_on_outlined, size: 14, color: AppColors.textGrey),
              SizedBox(width: 4),
              Text(
                '3.0 KM',
                style: TextStyle(fontSize: 12, color: AppColors.textGrey, fontFamily: 'Roboto'),
              ),
            ],
          ),
          actionButtons: [
            _buildOutlineButton(
              'Reschedule',
              Colors.black,
              Colors.black,
              () => onActionTriggered('Rescheduling...'),
            ),
            _buildOutlineButton(
              'Cancel',
              Colors.red,
              Colors.red,
              () => onActionTriggered('Cancelling...'),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Card 2: Awaiting Workshop status AC Service
        BookingStatusCard(
          statusText: 'Awaiting Workshop',
          statusTextColor: Colors.white,
          statusBgColor: const Color(0xFFE53935), // Solid RED custom container
          title: 'Ac Service',
          workshopName: 'Crank Bmw & Mini',
          bannerText: 'Workshop will respond within 1 hour',
        ),
      ],
    );
  }

  Widget _buildOutlineButton(
    String label,
    Color borderColor,
    Color textColor,
    VoidCallback onTap,
  ) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: borderColor, width: 1.2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 13,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }
}
