import 'package:flutter/material.dart';

class HistoryServiceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String spent;
  final String kilometers;

  const HistoryServiceCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.spent,
    required this.kilometers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFA8A8A8), // Figma Hex #A8A8A8
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Leading engine oil icon
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.oil_barrel_outlined,
              color: Color(0xFF1A1A1A), // Dark Icon contrast
              size: 24,
            ),
          ),
          const SizedBox(width: 14),

          // Left Column: Title and Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF1A1A1A), // Dark text contrast
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.black87, // Dark subtitle text
                    fontSize: 13,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ),

          // Right Column: Spent and KM
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'spent: $spent',
                style: const TextStyle(
                  color: Color(0xFF1A1A1A), // Dark spent text
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'KM:$kilometers',
                style: const TextStyle(
                  color: Colors.black87, // Dark KM text
                  fontSize: 12,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
