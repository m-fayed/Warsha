import 'package:flutter/material.dart';
import 'package:warsha_app/features/home_dashboard/presentation/cubit/workshops_filter_cubit.dart';

class WorkshopsFilterTabs extends StatelessWidget {
  final WorkshopFilter activeFilter;
  final Function(WorkshopFilter) onFilterChanged;

  const WorkshopsFilterTabs({
    super.key,
    required this.activeFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTabCapsule(
            label: 'Top Rated',
            isActive: activeFilter == WorkshopFilter.topRated,
            onTap: () => onFilterChanged(WorkshopFilter.topRated),
          ),
          _buildTabCapsule(
            label: 'Near Me',
            isActive: activeFilter == WorkshopFilter.nearMe,
            onTap: () => onFilterChanged(WorkshopFilter.nearMe),
          ),
          _buildTabCapsule(
            label: 'Offers',
            isActive: activeFilter == WorkshopFilter.offers,
            onTap: () => onFilterChanged(WorkshopFilter.offers),
          ),
        ],
      ),
    );
  }

  Widget _buildTabCapsule({
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          decoration: BoxDecoration(
            color: isActive ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: isActive ? Colors.black : Colors.grey.shade300,
              width: 1.0,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
