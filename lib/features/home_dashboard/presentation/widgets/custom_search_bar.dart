import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

/// Custom search bar widget with rounded corners
class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String>? onSubmitted;

  const CustomSearchBar({super.key, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppColors.orangeWhiteGradient,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              style: const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                hintText: 'Search Workshop or Service',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                filled: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
