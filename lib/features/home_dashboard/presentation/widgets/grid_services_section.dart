import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

/// Grid services section with service cards (Book Service, Car History, AI Advisor, Emergency)
class GridServicesSection extends StatelessWidget {
  final bool isSmallScreen;

  const GridServicesSection({
    super.key,
    required this.isSmallScreen,
  });

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        'title': 'Book Service',
        'icon': 'assets/icons/bookService.png',
        'isEmergency': false,
      },
      {
        'title': 'Car History',
        'icon': 'assets/icons/carHistory.png',
        'isEmergency': false,
      },
      {
        'title': 'Ai Advisor',
        'icon': 'assets/icons/AiAdviser.png',
        'isEmergency': false,
      },
      {
        'title': 'Emergency',
        'icon': 'assets/icons/emergency.png',
        'isEmergency': true,
      },
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: services.map((ser) {
        final bool isEmergency = ser['isEmergency'] as bool;
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 4.0,
            ),
            decoration: isEmergency
                ? AppColors.redWhiteGradient
                : AppColors.orangeWhiteGradient,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  ser['icon'] as String,
                  height: 24,
                  width: 24,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      isEmergency ? Icons.warning_amber_rounded : Icons.build,
                      color: isEmergency ? Colors.red[900] : AppColors.textDark,
                      size: 24,
                    );
                  },
                ),
                const SizedBox(height: 8),
                Text(
                  ser['title'] as String,
                  style: TextStyle(
                    color: isEmergency ? Colors.red[900] : AppColors.textDark,
                    fontSize: isSmallScreen ? 9 : 10,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}