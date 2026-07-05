import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class WorkshopServicesSection extends StatelessWidget {
  final String? servicesText;

  const WorkshopServicesSection({
    super.key,
    this.servicesText,
  });

  @override
  Widget build(BuildContext context) {
    const String defaultServices =
        'Engine diagnostics, BMW coding/programming, Transmission repair, '
        'Suspension work, Oil & filter changes, Electrical diagnostic, AC repair, Bodywork & paint';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Services they offer',
          style: TextStyle(
            color: AppColors.textDark,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        const SizedBox(height: 8),
        Text(
          servicesText ?? defaultServices,
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
