import 'package:flutter/material.dart';
class DarkCarInfoCard extends StatelessWidget {
  final String brand;
  final String specs;
  final String license;
  final String imagePath;

  const DarkCarInfoCard({
    super.key,
    required this.brand,
    required this.specs,
    required this.license,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0x1FFF7905),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFFF7905), width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Car',
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
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.directions_car, size: 40, color: Color(0xFFFF7905)),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(brand, style: const TextStyle(color: Color(0xFF1A1A1A), fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Roboto')),
                    const SizedBox(height: 6),
                    Text(specs, style: const TextStyle(color: Colors.black87, fontSize: 16, fontFamily: 'Roboto')),
                    const SizedBox(height: 6),
                    Text(license, style: const TextStyle(color: Colors.black87, fontSize: 16, fontFamily: 'Roboto')),
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