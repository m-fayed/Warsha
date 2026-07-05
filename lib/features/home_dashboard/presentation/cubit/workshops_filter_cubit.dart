import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

/// Active filter types for the Workshops Listing
enum WorkshopFilter { topRated, nearMe, offers }

/// UI Model representing a Workshop item on this screen
class WorkshopListItemModel extends Equatable {
  final String name;
  final String logoPath;
  final String specialty;
  final double rating;
  final Color logoBgColor;
  final String distance;

  const WorkshopListItemModel({
    required this.name,
    required this.logoPath,
    required this.specialty,
    required this.rating,
    required this.logoBgColor,
    required this.distance,
  });

  @override
  List<Object?> get props => [name, logoPath, specialty, rating, logoBgColor, distance];
}

/// State for WorkshopsFilterCubit
class WorkshopsFilterState extends Equatable {
  final WorkshopFilter activeFilter;
  final List<WorkshopListItemModel> workshops;

  const WorkshopsFilterState({
    required this.activeFilter,
    required this.workshops,
  });

  @override
  List<Object?> get props => [activeFilter, workshops];

  WorkshopsFilterState copyWith({
    WorkshopFilter? activeFilter,
    List<WorkshopListItemModel>? workshops,
  }) {
    return WorkshopsFilterState(
      activeFilter: activeFilter ?? this.activeFilter,
      workshops: workshops ?? this.workshops,
    );
  }
}

/// Cubit to manage Workshop Listing filter states
class WorkshopsFilterCubit extends Cubit<WorkshopsFilterState> {
  WorkshopsFilterCubit({WorkshopFilter initialFilter = WorkshopFilter.topRated})
      : super(WorkshopsFilterState(
          activeFilter: initialFilter,
          workshops: _getWorkshopsForFilter(initialFilter),
        ));

  /// Change active filter tab
  void changeFilter(WorkshopFilter filter) {
    emit(state.copyWith(
      activeFilter: filter,
      workshops: _getWorkshopsForFilter(filter),
    ));
  }

  /// Get corresponding mock dataset for each filter
  static List<WorkshopListItemModel> _getWorkshopsForFilter(WorkshopFilter filter) {
    switch (filter) {
      case WorkshopFilter.topRated:
        return const [
          WorkshopListItemModel(
            name: 'Bmw Station',
            logoPath: 'assets/images/BmwStation.png',
            specialty: 'Specialized in Bmw and mini cooper',
            rating: 5.0,
            logoBgColor: Color(0xFFFFD54F), // Yellow backdrop
            distance: '3.5 km',
          ),
          WorkshopListItemModel(
            name: "Bimmer's Egypt",
            logoPath: 'assets/images/bimmer.png',
            specialty: 'Specialized in Bmw',
            rating: 5.0,
            logoBgColor: Color(0xFF1A1A1A), // Dark backdrop
            distance: '2.4 km',
          ),
          WorkshopListItemModel(
            name: 'Crank Bmw & Mini',
            logoPath: 'assets/images/crank.png',
            specialty: 'Specialized in Bmw and mini cooper',
            rating: 4.5,
            logoBgColor: Color(0xFFE0E0E0), // Light grey backdrop
            distance: '3.0 km',
          ),
          WorkshopListItemModel(
            name: 'Bmw Club',
            logoPath: 'assets/images/BmwClub.png',
            specialty: 'Specialized in Bmw',
            rating: 4.5,
            logoBgColor: Color(0xFF292929), // Dark grey backdrop
            distance: '3.5 km',
          ),
          WorkshopListItemModel(
            name: 'Mansour service center',
            logoPath: 'assets/images/mansour.png',
            specialty: 'Specialized in Bmw',
            rating: 4.3,
            logoBgColor: Color(0xFFFAFAFA), // Clean silver/white backdrop
            distance: '5.0 km',
          ),
        ];
      case WorkshopFilter.nearMe:
        return const [
          WorkshopListItemModel(
            name: 'Bmw Station',
            logoPath: 'assets/images/BmwStation.png',
            specialty: '1.2 km away • Specialized in Bmw and mini cooper',
            rating: 5.0,
            logoBgColor: Color(0xFFFFD54F), // Yellow backdrop
            distance: '1.2 km',
          ),
          WorkshopListItemModel(
            name: "Bimmer's Egypt",
            logoPath: 'assets/images/bimmer.png',
            specialty: '2.4 km away • Specialized in Bmw',
            rating: 5.0,
            logoBgColor: Color(0xFF1A1A1A), // Dark backdrop
            distance: '2.4 km',
          ),
          WorkshopListItemModel(
            name: 'Bmw Club',
            logoPath: 'assets/images/BmwClub.png',
            specialty: '3.5 km away • Specialized in Bmw',
            rating: 4.5,
            logoBgColor: Color(0xFF292929), // Dark grey backdrop
            distance: '3.5 km',
          ),
        ];
      case WorkshopFilter.offers:
        return const [
          WorkshopListItemModel(
            name: 'Crank Bmw & Mini',
            logoPath: 'assets/images/crank.png',
            specialty: '20% off Oil & Filter Service',
            rating: 4.5,
            logoBgColor: Color(0xFFE0E0E0), // Light grey backdrop
            distance: '3.0 km',
          ),
          WorkshopListItemModel(
            name: "Bimmer's Egypt",
            logoPath: 'assets/images/bimmer.png',
            specialty: 'Free Diagnosis on OBD Scanner scan',
            rating: 5.0,
            logoBgColor: Color(0xFF1A1A1A), // Dark backdrop
            distance: '2.4 km',
          ),
        ];
    }
  }
}
