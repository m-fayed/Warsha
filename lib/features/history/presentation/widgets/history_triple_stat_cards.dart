import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class HistoryTripleStatCards extends StatelessWidget {
  final String totalServices;
  final String totalSpent;
  final String sinceYear;

  const HistoryTripleStatCards({
    super.key,
    required this.totalServices,
    required this.totalSpent,
    required this.sinceYear,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(label: 'Total service', value: totalServices),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(label: 'Total Spent', value: totalSpent),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(label: 'Since', value: sinceYear),
        ),
      ],
    );
  }

  Widget _buildStatCard({required String label, required String value}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF000000), width: 1.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textGrey,
              fontSize: 15,
              fontFamily: 'Roboto',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.textDark,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
