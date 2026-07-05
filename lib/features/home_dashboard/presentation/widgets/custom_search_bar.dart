import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

/// Custom search bar widget with rounded corners
class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String>? onSubmitted;

  const CustomSearchBar({
    super.key,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkBgSecondary
            : const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : AppColors.textDark,
                fontFamily: 'Roboto',
              ),
              onSubmitted: onSubmitted,
              decoration: const InputDecoration(
                hintText: 'Search Workshop or Service',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontFamily: 'Roboto',
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
                filled: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}