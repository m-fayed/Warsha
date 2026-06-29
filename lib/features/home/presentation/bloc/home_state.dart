import 'package:equatable/equatable.dart';
import '../../domain/entities/booking_entity.dart';
import '../../domain/entities/workshop_entity.dart';

/// HomeState is the base class for all home feature states
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

/// HomeInitialState is the initial state
class HomeInitialState extends HomeState {
  const HomeInitialState();
}

/// HomeLoadingState indicates loading in progress
class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

/// HomeLoadedState indicates successful data load
class HomeLoadedState extends HomeState {
  final List<Workshop> workshops;
  final List<Booking> bookings;

  const HomeLoadedState({
    required this.workshops,
    required this.bookings,
  });

  @override
  List<Object?> get props => [workshops, bookings];
}

/// HomeErrorState indicates an error occurred
class HomeErrorState extends HomeState {
  final String message;

  const HomeErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
