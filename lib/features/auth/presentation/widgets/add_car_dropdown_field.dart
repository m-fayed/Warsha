import 'package:flutter/material.dart';

class AddCarDropdownField extends StatelessWidget {
  final String label;
  final String? selectedValue;
  final bool isEnabled;
  final VoidCallback onTap;

  const AddCarDropdownField({
    super.key,
    required this.label,
    required this.selectedValue,
    required this.isEnabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: isEnabled ? 1.0 : 0.5,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5), // Light gray background
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedValue ?? label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: selectedValue != null
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: selectedValue != null
                      ? Colors.black87
                      : Colors.grey.shade500,
                  fontFamily: 'Roboto',
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: isEnabled ? Colors.black54 : Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
