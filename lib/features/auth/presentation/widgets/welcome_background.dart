import 'package:flutter/material.dart';

class WelcomeBackground extends StatelessWidget {
  const WelcomeBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFFC76B), // Bright top orange
            Color(0xFFFFB951), // Light mid-orange
            Color(0xFFE8911C), // Medium orange
            Color(0xFFC9740C), // Rich bottom orange
          ],
          stops: [0.0, 0.3, 0.6, 1.0], // Smooth transitions
        ),
      ),
    );
  }
}
