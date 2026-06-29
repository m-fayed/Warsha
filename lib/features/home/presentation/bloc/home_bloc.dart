import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_featured_workshops_usecase.dart';
import '../../domain/usecases/get_upcoming_bookings_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

/// HomeBloc manages the state and business logic for the home feature
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetFeaturedWorkshopsUsecase getFeaturedWorkshopsUsecase;
  final GetUpcomingBookingsUsecase getUpcomingBookingsUsecase;

  HomeBloc({
    required this.getFeaturedWorkshopsUsecase,
    required this.getUpcomingBookingsUsecase,
  }) : super(const HomeInitialState()) {
    on<LoadFeaturedWorkshopsEvent>(_onLoadFeaturedWorkshops);
    on<LoadUpcomingBookingsEvent>(_onLoadUpcomingBookings);
    on<RefreshHomeDataEvent>(_onRefreshHomeData);
  }

  /// Handle LoadFeaturedWorkshopsEvent
  Future<void> _onLoadFeaturedWorkshops(
    LoadFeaturedWorkshopsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoadingState());

    final workshopsResult = await getFeaturedWorkshopsUsecase();
    final bookingsResult = await getUpcomingBookingsUsecase();

    if (workshopsResult.isSuccess && bookingsResult.isSuccess) {
      emit(HomeLoadedState(
        workshops: workshopsResult.getOrNull() ?? [],
        bookings: bookingsResult.getOrNull() ?? [],
      ));
    } else {
      final errorMessage =
          !workshopsResult.isSuccess ? 'فشل تحميل الورش' : 'فشل تحميل الحجوزات';
      emit(HomeErrorState(message: errorMessage));
    }
  }

  /// Handle LoadUpcomingBookingsEvent
  Future<void> _onLoadUpcomingBookings(
    LoadUpcomingBookingsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoadingState());

    final result = await getUpcomingBookingsUsecase();

    if (result.isSuccess) {
      final currentState = state;
      if (currentState is HomeLoadedState) {
        emit(HomeLoadedState(
          workshops: currentState.workshops,
          bookings: result.getOrNull() ?? [],
        ));
      } else {
        emit(HomeLoadedState(
          workshops: [],
          bookings: result.getOrNull() ?? [],
        ));
      }
    } else {
      emit(const HomeErrorState(message: 'فشل تحميل الحجوزات'));
    }
  }

  /// Handle RefreshHomeDataEvent
  Future<void> _onRefreshHomeData(
    RefreshHomeDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    await _onLoadFeaturedWorkshops(
      const LoadFeaturedWorkshopsEvent(),
      emit,
    );
  }
}
