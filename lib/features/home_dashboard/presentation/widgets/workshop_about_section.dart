import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class WorkshopAboutSection extends StatelessWidget {
  final String name;
  final String? customAboutText;

  const WorkshopAboutSection({
    super.key,
    required this.name,
    this.customAboutText,
  });

  @override
  Widget build(BuildContext context) {
    // Generate high-fidelity description text customized for name context
    final String aboutText = customAboutText ??
        '$name is a premium car maintenance workshop located in New Cairo. '
        'We specialize in BMW and Mini Cooper repairs, diagnostic scanning, and electronic coding. '
        'Our certified mechanics utilize state-of-the-art diagnostic equipment to ensure your vehicle receives '
        'uncompromising service and care. We are committed to absolute customer satisfaction and premium service standards.';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'About',
          style: TextStyle(
            color: AppColors.textDark,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        const SizedBox(height: 8),
        Text(
          aboutText,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 13.5,
            height: 1.5,
            fontFamily: 'Roboto',
          ),
        ),
      ],
    );
  }
}
