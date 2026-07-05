import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class HelpSupportSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const HelpSupportSearchBar({
    super.key,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3E0), // Light orange tint background
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primaryOrange,
          width: 1.2,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(
          color: AppColors.textDark,
          fontSize: 15,
          fontFamily: 'Roboto',
        ),
        decoration: InputDecoration(
          hintText: 'Search Workshop or Service',
          filled: true,
          fillColor: Colors.transparent,
          hintStyle: TextStyle(
            color: AppColors.primaryOrange.withValues(alpha: 0.6),
            fontSize: 15,
            fontFamily: 'Roboto',
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.primaryOrange,
            size: 22,
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 32,
            minHeight: 22,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
          ),
        ),
      ),
    );
  }
}
