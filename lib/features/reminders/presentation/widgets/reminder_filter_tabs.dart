import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class ReminderFilterTabs extends StatelessWidget {
  final int activeTab;
  final ValueChanged<int> onTabChanged;

  const ReminderFilterTabs({
    super.key,
    required this.activeTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          // Tab 1: Upcoming (3) - Active style (Dark background, white text)
          _buildTabCapsule(
            label: 'Upcoming (3)',
            isSelected: activeTab == 0,
            bgColor: activeTab == 0 ? const Color(0xFF1E1E1E) : Colors.white,
            textColor: activeTab == 0 ? Colors.white : AppColors.textDark,
            borderColor: activeTab == 0
                ? const Color(0xFF1E1E1E)
                : Colors.grey.shade300,
            onTap: () => onTabChanged(0),
          ),
          const SizedBox(width: 10),

          // Tab 2: Urgent (1) - Active style (Dark background) or Orange outline when inactive
          _buildTabCapsule(
            label: 'Urgent (1)',
            isSelected: activeTab == 1,
            bgColor: activeTab == 1 ? const Color(0xFF1E1E1E) : Colors.white,
            textColor: activeTab == 1 ? Colors.white : const Color(0xFFFF7905),
            borderColor: activeTab == 1
                ? const Color(0xFF1E1E1E)
                : const Color(0xFFFF7905),
            onTap: () => onTabChanged(1),
          ),
          const SizedBox(width: 10),

          // Tab 3: Completed - Active style (Dark background) or Muted gray outline when inactive
          _buildTabCapsule(
            label: 'Completed',
            isSelected: activeTab == 2,
            bgColor: activeTab == 2 ? const Color(0xFF1E1E1E) : Colors.white,
            textColor: activeTab == 2 ? Colors.white : AppColors.textGrey,
            borderColor: activeTab == 2
                ? const Color(0xFF1E1E1E)
                : Colors.grey.shade300,
            onTap: () => onTabChanged(2),
          ),
        ],
      ),
    );
  }

  Widget _buildTabCapsule({
    required String label,
    required bool isSelected,
    required Color bgColor,
    required Color textColor,
    required Color borderColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: borderColor, width: 1.2),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 13,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
      ),
    );
  }
}
