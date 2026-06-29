import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class HelpSupportFaqSection extends StatelessWidget {
  const HelpSupportFaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Frequently Asked',
          style: TextStyle(
            color: AppColors.textDark,
            fontSize: 17,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFFF3E0), // Light orange tint background
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.primaryOrange,
              width: 1.2,
            ),
          ),
          child: Column(
            children: [
              _buildFAQRow('How do i book a service?'),
              _buildFAQRow('Are the workshop verified?'),
              _buildFAQRow('Can i cancel my booking?'),
              _buildFAQRow('How are reminders calculated?'),
              _buildFAQRow('Is my Information safe?', showDivider: false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFAQRow(String question, {bool showDivider = true}) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Click trigger placeholder
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    question,
                    style: const TextStyle(
                      color: AppColors.textDark,
                      fontSize: 14.5,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.primaryOrange,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          Divider(
            color: AppColors.primaryOrange.withValues(alpha: 0.2),
            height: 1,
            thickness: 1.2,
            indent: 16,
            endIndent: 16,
          ),
      ],
    );
  }
}
