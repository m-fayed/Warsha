import 'package:flutter/material.dart';

class PaymentMethodTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String assetPath;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.assetPath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFFF7905).withValues(alpha: 0.12), // Orange tinted fill
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFFF7905)
                : const Color(0xFFFF7905).withValues(alpha: 0.3), // Highlight active selection
            width: isSelected ? 1.8 : 1.2,
          ),
        ),
        child: Row(
          children: [
            // Left: Payment Asset Image
            Image.asset(
              assetPath,
              width: 38,
              height: 38,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                // Fallback icon if image is missing
                return Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.payment_outlined,
                    color: Colors.black54,
                    size: 20,
                  ),
                );
              },
            ),
            const SizedBox(width: 16),

            // Middle: Option title & Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 11,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),

            // Right: Chevron arrow
            const Icon(
              Icons.chevron_right,
              color: Colors.black87,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
