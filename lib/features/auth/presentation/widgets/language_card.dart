import 'package:flutter/material.dart';

class LanguageCard extends StatelessWidget {
  final String languageName;
  final Widget flagWidget;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageCard({
    super.key,
    required this.languageName,
    required this.flagWidget,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFECE0) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFFFF6B00) : Colors.grey.shade300,
            width: isSelected ? 2.0 : 1.0,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFFFF6B00).withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Row(
          children: [
            // Left side: Country flag image/icon
            flagWidget,
            const SizedBox(width: 16),

            // Middle: Language name text
            Expanded(
              child: Text(
                languageName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.black : Colors.grey.shade800,
                  fontFamily: 'Roboto',
                ),
              ),
            ),

            // Right side: Custom radio button
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFFFF6B00)
                      : Colors.grey.shade400,
                  width: 2.0,
                ),
                color: Colors.transparent,
              ),
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: isSelected ? 12 : 0,
                  height: isSelected ? 12 : 0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFF6B00),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
