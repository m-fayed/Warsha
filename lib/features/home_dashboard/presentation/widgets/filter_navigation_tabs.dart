import 'package:flutter/material.dart';
import 'package:warsha_app/features/home_dashboard/presentation/cubit/workshops_filter_cubit.dart';

/// Filter navigation tabs for workshops (Top Rated, Near Me, Offers)
class FilterNavigationTabs extends StatelessWidget {
  final Function(WorkshopFilter) onFilterSelected;

  const FilterNavigationTabs({
    super.key,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    final filters = [
      {'label': 'Top Rated', 'filter': WorkshopFilter.topRated},
      {'label': 'Near Me', 'filter': WorkshopFilter.nearMe},
      {'label': 'Offers', 'filter': WorkshopFilter.offers},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: filters.map((item) {
        final label = item['label'] as String;
        final filter = item['filter'] as WorkshopFilter;
        return Expanded(
          child: GestureDetector(
            onTap: () => onFilterSelected(filter),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.grey.withValues(alpha: 0.3),
                  width: 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}