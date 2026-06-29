import 'package:warsha_app/core/network/api_result.dart';
import '../entities/booking_entity.dart';
import '../entities/workshop_entity.dart';

/// HomeRepository defines the interface for home feature data access
abstract class HomeRepository {
  /// Get featured workshops
  Future<ApiResult<List<Workshop>>> getFeaturedWorkshops();

  /// Get all upcoming bookings
  Future<ApiResult<List<Booking>>> getUpcomingBookings();

  /// Get workshop details
  Future<ApiResult<Workshop>> getWorkshopDetails(String workshopId);

  /// Get available time slots for a workshop
  Future<ApiResult<List<String>>> getAvailableTimeSlots(
    String workshopId,
    DateTime date,
  );
}
