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
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Live car status',
            style: TextStyle(
              color: Colors.white,
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
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.directions_car, size: 40, color: Colors.white),
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
                      decoration: BoxDecoration(color: Colors.grey.shade700, borderRadius: BorderRadius.circular(3)),
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
                    Text(range, style: const TextStyle(color: Colors.white, fontSize: 14.5, fontFamily: 'Roboto', height: 1.4)),
                    const SizedBox(height: 4),
                    Text(health, style: const TextStyle(color: Colors.white, fontSize: 14.5, fontFamily: 'Roboto', height: 1.4)),
                    const SizedBox(height: 4),
                    Text(nextService, style: const TextStyle(color: Colors.white, fontSize: 14.5, fontFamily: 'Roboto', height: 1.4)),
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