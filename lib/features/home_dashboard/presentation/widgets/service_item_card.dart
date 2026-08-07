import 'package:flutter/material.dart';
import 'package:warsha_app/core/utils/haptic_helper.dart';

class ServiceItemCard extends StatelessWidget {
  final String serviceName;
  final int price;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const ServiceItemCard({
    super.key,
    required this.serviceName,
    required this.price,
    required this.icon,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticHelper.lightImpact();
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0x33FF7905) // Highlighted 20% tint
              : const Color(0x1FFF7905), // Figma Hex #FF79051F
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFFF7905),
            width: isSelected ? 2.0 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isSelected ? 0.1 : 0.05),
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
                color: isSelected
                    ? const Color(0xFFFF7905)
                    : Colors.black.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : const Color(0xFF1A1A1A),
                size: 24,
              ),
            ),
            const SizedBox(width: 16),

            // Middle: serviceName and price details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        serviceName,
                        style: const TextStyle(
                          color: Color(0xFF1A1A1A),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      if (isSelected) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF7905),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Selected',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Price: EGP $price',
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 13,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),

            // Right: Chevron right arrow icon
            Icon(
              Icons.chevron_right,
              color: isSelected ? const Color(0xFFFF7905) : const Color(0xFF1A1A1A),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
