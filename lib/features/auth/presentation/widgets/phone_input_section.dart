import 'package:flutter/material.dart';

class PhoneInputSection extends StatelessWidget {
  final TextEditingController controller;

  const PhoneInputSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Phone Input Display Box
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5), // Light gray background
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              const Text(
                '🇪🇬 +20',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(width: 12),
              // Divider
              Container(
                width: 1,
                height: 24,
                color: Colors.grey.shade400,
              ),
              const SizedBox(width: 12),
              // Phone Input TextField
              Expanded(
                child: TextField(
                  controller: controller,
                  readOnly: true,
                  showCursor: true,
                  autofocus: true,
                  cursorColor: const Color(0xFFFF6B00),
                  cursorWidth: 2.0,
                  cursorHeight: 22,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    fontFamily: 'Roboto',
                    letterSpacing: 1.5,
                  ),
                  decoration: InputDecoration(
                    hintText: '1XXXXXXXXX',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade400,
                      fontFamily: 'Roboto',
                      letterSpacing: 1.5,
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Thin divider
        Divider(color: Colors.grey.shade200, thickness: 1),
        const SizedBox(height: 16),

        // Terms text
        const Text(
          "By continuing, you agree to our Terms of Service\nand Privacy Policy",
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
            height: 1.5,
            fontFamily: 'Roboto',
          ),
        ),
      ],
    );
  }
}
