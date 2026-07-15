import 'package:flutter/material.dart';

class ServiceItemCard extends StatelessWidget {
  final String serviceName;
  final int price;
  final IconData icon;
  final VoidCallback onTap;

  const ServiceItemCard({
    super.key,
    required this.serviceName,
    required this.price,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0x1FFF7905), // Figma Hex #FF79051F
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFFF7905), width: 1.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Left: Custom rounded container for leading icon
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF1A1A1A), // Dark icon
                size: 24,
              ),
            ),
            const SizedBox(width: 16),

            // Middle: serviceName and price details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    serviceName,
                    style: const TextStyle(
                      color: Color(0xFF1A1A1A), // Dark text contrast
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Price: EGP $price',
                    style: const TextStyle(
                      color: Colors.black87, // Dark price text
                      fontSize: 13,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),

            // Right: Chevron right arrow icon
            const Icon(Icons.chevron_right, color: Color(0xFF1A1A1A), size: 24),
          ],
        ),
      ),
    );
  }
}
