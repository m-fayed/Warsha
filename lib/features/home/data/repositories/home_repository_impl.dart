import 'package:warsha_app/core/network/api_result.dart';
import '../../domain/entities/booking_entity.dart';
import '../../domain/entities/workshop_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_local_data_source.dart';

/// HomeRepositoryImpl implements the HomeRepository interface
class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImpl({required this.localDataSource});

  @override
  Future<ApiResult<List<Workshop>>> getFeaturedWorkshops() async {
    final result = await localDataSource.getFeaturedWorkshops();

    return result.when(
      success: (data) => ApiSuccess(
        data.map((model) => model.toEntity()).toList(),
      ),
      failure: (message, statusCode) => ApiFailure(
        message: message,
        statusCode: statusCode,
      ),
    );
  }

  @override
  Future<ApiResult<List<Booking>>> getUpcomingBookings() async {
    final result = await localDataSource.getUpcomingBookings();

    return result.when(
      success: (data) => ApiSuccess(
        data.map((model) => model.toEntity()).toList(),
      ),
      failure: (message, statusCode) => ApiFailure(
        message: message,
        statusCode: statusCode,
      ),
    );
  }

  @override
  Future<ApiResult<Workshop>> getWorkshopDetails(String workshopId) async {
    final result = await localDataSource.getWorkshopDetails(workshopId);

    return result.when(
      success: (data) => ApiSuccess(data.toEntity()),
      failure: (message, statusCode) => ApiFailure(
        message: message,
        statusCode: statusCode,
      ),
    );
  }

  @override
  Future<ApiResult<List<String>>> getAvailableTimeSlots(
    String workshopId,
    DateTime date,
  ) async {
    final result =
        await localDataSource.getAvailableTimeSlots(workshopId, date);

    return result.when(
      success: (data) => ApiSuccess(data),
      failure: (message, statusCode) => ApiFailure(
        message: message,
        statusCode: statusCode,
      ),
    );
  }
}
