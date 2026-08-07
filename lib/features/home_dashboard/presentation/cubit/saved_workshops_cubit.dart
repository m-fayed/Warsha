import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:warsha_app/features/home_dashboard/presentation/cubit/workshops_filter_cubit.dart';

/// Predefined list of known workshops for lookup
const List<WorkshopListItemModel> kAllWorkshops = [
  WorkshopListItemModel(
    name: 'Bmw Station',
    logoPath: 'assets/images/BmwStation.png',
    specialty: 'Specialized in Bmw and mini cooper',
    rating: 5.0,
    logoBgColor: Color(0xFFFFD54F),
    distance: '3.5 km',
  ),
  WorkshopListItemModel(
    name: "Bimmer's Egypt",
    logoPath: 'assets/images/bimmer.png',
    specialty: 'Specialized in Bmw',
    rating: 5.0,
    logoBgColor: Color(0xFF1A1A1A),
    distance: '2.4 km',
  ),
  WorkshopListItemModel(
    name: 'Crank Bmw & Mini',
    logoPath: 'assets/images/crank.png',
    specialty: 'Specialized in Bmw and mini cooper',
    rating: 4.5,
    logoBgColor: Color(0xFFE0E0E0),
    distance: '3.0 km',
  ),
  WorkshopListItemModel(
    name: 'Bmw Club',
    logoPath: 'assets/images/BmwClub.png',
    specialty: 'Specialized in Bmw',
    rating: 4.5,
    logoBgColor: Color(0xFF292929),
    distance: '3.5 km',
  ),
  WorkshopListItemModel(
    name: 'Mansour service center',
    logoPath: 'assets/images/mansour.png',
    specialty: 'Specialized in Bmw',
    rating: 4.3,
    logoBgColor: Color(0xFFFAFAFA),
    distance: '5.0 km',
  ),
];

/// State for SavedWorkshopsCubit
class SavedWorkshopsState extends Equatable {
  final Set<String> savedWorkshopNames;

  const SavedWorkshopsState({
    this.savedWorkshopNames = const {},
  });

  /// Get list of WorkshopListItemModel objects that are currently favorited
  List<WorkshopListItemModel> get savedWorkshops {
    return kAllWorkshops
        .where((workshop) => savedWorkshopNames.contains(workshop.name))
        .toList();
  }

  bool isFavorite(String name) => savedWorkshopNames.contains(name);

  @override
  List<Object?> get props => [savedWorkshopNames];

  SavedWorkshopsState copyWith({
    Set<String>? savedWorkshopNames,
  }) {
    return SavedWorkshopsState(
      savedWorkshopNames: savedWorkshopNames ?? this.savedWorkshopNames,
    );
  }
}

/// Cubit to manage saved/favorited workshops state across the application
class SavedWorkshopsCubit extends Cubit<SavedWorkshopsState> {
  SavedWorkshopsCubit()
      : super(const SavedWorkshopsState(savedWorkshopNames: {'Bmw Club'}));

  /// Toggle favorite status of a workshop by name or model
  void toggleFavorite(dynamic workshop) {
    final String name = workshop is WorkshopListItemModel
        ? workshop.name
        : workshop.toString();

    final currentSet = Set<String>.from(state.savedWorkshopNames);
    if (currentSet.contains(name)) {
      currentSet.remove(name);
    } else {
      currentSet.add(name);
    }

    emit(state.copyWith(savedWorkshopNames: currentSet));
  }

  /// Check if a workshop is favorited
  bool isFavorite(String name) {
    return state.isFavorite(name);
  }
}
