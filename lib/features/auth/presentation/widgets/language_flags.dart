import 'package:flutter/material.dart';

class EgyptFlag extends StatelessWidget {
  const EgyptFlag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: Column(
          children: [
            Expanded(child: Container(color: const Color(0xFFC8102E))), // Red
            Expanded(
              child: Container(
                color: Colors.white, // White
                child: Center(
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Color(0xFFC19A2E), // Gold Eagle emblem
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(child: Container(color: Colors.black)), // Black
          ],
        ),
      ),
    );
  }
}

class UsFlag extends StatelessWidget {
  const UsFlag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: Stack(
          children: [
            // Stripes background (red & white)
            Column(
              children: List.generate(7, (index) {
                return Expanded(
                  child: Container(
                    color: index % 2 == 0
                        ? const Color(0xFFB22234)
                        : Colors.white,
                  ),
                );
              }),
            ),
            // Canton (blue corner rectangle)
            Positioned(
              left: 0,
              top: 0,
              width: 16,
              height: 13,
              child: Container(
                color: const Color(0xFF3C3B6E),
                child: const Center(
                  child: Icon(Icons.star, size: 8, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FranceFlag extends StatelessWidget {
  const FranceFlag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: Row(
          children: [
            Expanded(child: Container(color: const Color(0xFF002395))), // Blue
            Expanded(child: Container(color: Colors.white)), // White
            Expanded(child: Container(color: const Color(0xFFED2939))), // Red
          ],
        ),
      ),
    );
  }
}
