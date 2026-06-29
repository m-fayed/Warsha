import 'package:flutter/material.dart';

class WelcomeCompositeHeader extends StatelessWidget {
  const WelcomeCompositeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/background.png',
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          // Fallback: show placeholder if image is missing
          return Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                'WARSHA',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  letterSpacing: 3.5,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
