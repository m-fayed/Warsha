import 'package:flutter/material.dart';

class DarkLiveCarStatusCard extends StatelessWidget {
  final String range;
  final String health;
  final String nextService;
  final String imagePath;

  const DarkLiveCarStatusCard({
    super.key,
    required this.range,
    required this.health,
    required this.nextService,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color(0xFFE6E6E6), // Blended bottom color
            Color(0xFFCC6104), // Blended top color
          ],
          stops: [0.25, 1.0],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Live car status',
            style: TextStyle(
              color: Color(0xFF1A1A1A),
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: AspectRatio(
                  aspectRatio: 1.3,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.directions_car, size: 40, color: Color(0xFFCC6104)),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      height: 5,
                      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(3)),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            gradient: const LinearGradient(colors: [Color(0xFFFF6B00), Color(0xFF4CAF50)]),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(range, style: const TextStyle(color: Colors.black87, fontSize: 14.5, fontFamily: 'Roboto', height: 1.4)),
                    const SizedBox(height: 4),
                    Text(health, style: const TextStyle(color: Colors.black87, fontSize: 14.5, fontFamily: 'Roboto', height: 1.4)),
                    const SizedBox(height: 4),
                    Text(nextService, style: const TextStyle(color: Colors.black87, fontSize: 14.5, fontFamily: 'Roboto', height: 1.4)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}