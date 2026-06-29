import 'package:equatable/equatable.dart';

/// HomeEvent is the base class for all home feature events
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

/// LoadFeaturedWorkshopsEvent triggers loading featured workshops
class LoadFeaturedWorkshopsEvent extends HomeEvent {
  const LoadFeaturedWorkshopsEvent();
}

/// LoadUpcomingBookingsEvent triggers loading upcoming bookings
class LoadUpcomingBookingsEvent extends HomeEvent {
  const LoadUpcomingBookingsEvent();
}

/// RefreshHomeDataEvent triggers refreshing all home data
class RefreshHomeDataEvent extends HomeEvent {
  const RefreshHomeDataEvent();
}
