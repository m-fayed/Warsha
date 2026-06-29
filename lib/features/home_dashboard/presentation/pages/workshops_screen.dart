import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import '../cubit/workshops_filter_cubit.dart';
import '../widgets/workshop_list_item_card.dart';
import '../widgets/workshops_custom_app_bar.dart';
import '../widgets/workshops_search_bar.dart';
import '../widgets/workshops_filter_tabs.dart';
import '../widgets/workshops_footer.dart';

/// Workshops Screen displaying a list of workshops filtered dynamically.
class WorkshopsScreen extends StatefulWidget {
  final WorkshopFilter initialFilter;
  final String? initialSearchQuery;

  const WorkshopsScreen({
    super.key,
    this.initialFilter = WorkshopFilter.topRated,
    this.initialSearchQuery,
  });

  @override
  State<WorkshopsScreen> createState() => _WorkshopsScreenState();
}

class _WorkshopsScreenState extends State<WorkshopsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    if (widget.initialSearchQuery != null &&
        widget.initialSearchQuery!.isNotEmpty) {
      _searchController.text = widget.initialSearchQuery!;
      _searchQuery = widget.initialSearchQuery!;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WorkshopsFilterCubit(initialFilter: widget.initialFilter),
      child: Scaffold(
        backgroundColor: Colors.white, // White clean background
        body: SafeArea(
          child: BlocBuilder<WorkshopsFilterCubit, WorkshopsFilterState>(
            builder: (context, state) {
              final cubit = context.read<WorkshopsFilterCubit>();

              final filteredWorkshops = _searchQuery.isEmpty
                  ? state.workshops
                  : state.workshops.where((workshop) {
                      final nameMatch = workshop.name
                          .toLowerCase()
                          .contains(_searchQuery.toLowerCase());
                      final specialtyMatch = workshop.specialty
                          .toLowerCase()
                          .contains(_searchQuery.toLowerCase());
                      return nameMatch || specialtyMatch;
                    }).toList();

              return Column(
                children: [
                  // 1. TOP NAVIGATION BAR (AppBar Area)
                  const WorkshopsCustomAppBar(),

                  // Search bar - Exclusive to Top Rated (default) view
                  if (state.activeFilter == WorkshopFilter.topRated)
                    WorkshopsSearchBar(
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                    ),

                  const SizedBox(height: 16),

                  // 2. FILTER BUTTON TABS ROW
                  WorkshopsFilterTabs(
                    activeFilter: state.activeFilter,
                    onFilterChanged: (filter) {
                      _searchController.clear();
                      setState(() {
                        _searchQuery = '';
                      });
                      cubit.changeFilter(filter);
                    },
                  ),

                  const SizedBox(height: 16),

                  // 3. WORKSHOPS LIST VIEW (ListView.builder)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: filteredWorkshops.isEmpty
                          ? const Center(
                              child: Text(
                                'No workshops found.',
                                style: TextStyle(
                                  color: AppColors.textGrey,
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            )
                          : ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: filteredWorkshops.length,
                              itemBuilder: (context, index) {
                                final workshop = filteredWorkshops[index];
                                return WorkshopListItemCard(
                                  name: workshop.name,
                                  logoPath: workshop.logoPath,
                                  specialty: workshop.specialty,
                                  rating: workshop.rating,
                                  logoBgColor: workshop.logoBgColor,
                                  distance: workshop.distance,
                                );
                              },
                            ),
                    ),
                  ),

                  // 4. PERSISTENT FOOTER TEXT
                  const WorkshopsFooter(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
