import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class HelpSupportQuickCards extends StatelessWidget {
  const HelpSupportQuickCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildQuickSupportCard(
            icon: Icons.chat_bubble_outline,
            title: 'Chat with us',
            subtitle: 'Usually replies in a few mins',
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildQuickSupportCard(
            icon: Icons.mail_outline,
            title: 'Email Support',
            subtitle: 'Help@warsha.app',
          ),
        ),
      ],
    );
  }

  Widget _buildQuickSupportCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      height: 120,
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3E0), // Light orange tint background
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryOrange, width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: AppColors.primaryOrange, size: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textDark,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  color: AppColors.textGrey,
                  fontSize: 11,
                  fontFamily: 'Roboto',
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
