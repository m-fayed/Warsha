import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class BookingScheduleDetailsCard extends StatelessWidget {
  final String dateText;
  final String timeText;
  final String workshopText;

  const BookingScheduleDetailsCard({
    super.key,
    this.dateText = 'Tuesday, 14 May 2026',
    this.timeText = '10:00 AM',
    this.workshopText = 'Bmw station, 3.0km • Elrehab city',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0x1FFF7905), // Figma Hex #FF79051F
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFFF7905), width: 1.0), // Orange border
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow(
            icon: Icons.calendar_month_outlined,
            label: 'Date',
            value: dateText,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Divider(color: Colors.black12, height: 1),
          ),
          _buildDetailRow(
            icon: Icons.access_time_outlined,
            label: 'Time',
            value: timeText,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Divider(color: Colors.black12, height: 1),
          ),
          _buildDetailRow(
            icon: Icons.location_on_outlined,
            label: 'Workshop',
            value: workshopText,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        // Orange Icon inside dark container
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: AppColors.primaryOrange.withValues(alpha: 0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: AppColors.primaryOrange,
            size: 20,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  color: Color(0xFF1A1A1A),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
