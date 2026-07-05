import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class EditProfilePersonalInfo extends StatelessWidget {
  final String name;
  final String phone;
  final String email;
  final VoidCallback onEditName;
  final VoidCallback onEditPhone;
  final VoidCallback onEditEmail;

  const EditProfilePersonalInfo({
    super.key,
    required this.name,
    required this.phone,
    required this.email,
    required this.onEditName,
    required this.onEditPhone,
    required this.onEditEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'PERSONAL INFO',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            fontFamily: 'Roboto',
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFFF3E0), // Soft orange tinted background
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.primaryOrange,
              width: 1.2,
            ),
          ),
          child: Column(
            children: [
              _buildPersonalInfoRow(
                label: 'FULL NAME',
                value: name,
                onTap: onEditName,
              ),
              Divider(
                color: Colors.grey.shade300,
                height: 1,
                thickness: 1.5,
              ),
              _buildPersonalInfoRow(
                label: 'PHONE NUMBER',
                value: phone,
                onTap: onEditPhone,
              ),
              Divider(
                color: Colors.grey.shade300,
                height: 1,
                thickness: 1.5,
              ),
              _buildPersonalInfoRow(
                label: 'EMAIL',
                value: email,
                onTap: onEditEmail,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPersonalInfoRow({
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      color: AppColors.primaryOrange,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      color: AppColors.textDark,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.edit, color: AppColors.primaryOrange, size: 20),
          ],
        ),
      ),
    );
  }
}
