import 'package:warsha_app/core/network/api_result.dart';
import '../repositories/home_repository.dart';
import '../entities/booking_entity.dart';

/// GetUpcomingBookingsUsecase is responsible for fetching upcoming bookings
class GetUpcomingBookingsUsecase {
  final HomeRepository repository;

  GetUpcomingBookingsUsecase({required this.repository});

  Future<ApiResult<List<Booking>>> call() {
    return repository.getUpcomingBookings();
  }
}
