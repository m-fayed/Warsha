import 'package:warsha_app/core/network/api_result.dart';
import '../models/workshop_model.dart';
import '../models/booking_model.dart';

/// HomeLocalDataSource defines interface for local/mock data
abstract class HomeLocalDataSource {
  /// Get featured workshops (mock data)
  Future<ApiResult<List<WorkshopModel>>> getFeaturedWorkshops();

  /// Get upcoming bookings (mock data)
  Future<ApiResult<List<BookingModel>>> getUpcomingBookings();

  /// Get workshop details (mock data)
  Future<ApiResult<WorkshopModel>> getWorkshopDetails(String workshopId);

  /// Get available time slots (mock data)
  Future<ApiResult<List<String>>> getAvailableTimeSlots(
    String workshopId,
    DateTime date,
  );
}

/// HomeLocalDataSourceImpl implements mock data source
class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<ApiResult<List<WorkshopModel>>> getFeaturedWorkshops() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    final mockData = [
      WorkshopModel(
        id: '1',
        name: 'أبو علي لصيانة السيارات',
        location: 'القاهرة - مدينة نصر',
        phone: '+20100123456',
        rating: 4.8,
        reviewCount: 245,
        services: ['Oil Change', 'Brake Service', 'Tire Rotation'],
        imageUrl: 'https://via.placeholder.com/400x300?text=Workshop+1',
      ),
      WorkshopModel(
        id: '2',
        name: 'الصيانة الشاملة',
        location: 'الجيزة - الهرم',
        phone: '+20100234567',
        rating: 4.6,
        reviewCount: 189,
        services: ['Engine Repair', 'Transmission', 'AC Service'],
        imageUrl: 'https://via.placeholder.com/400x300?text=Workshop+2',
      ),
      WorkshopModel(
        id: '3',
        name: 'مركز الصيانة المتقدم',
        location: 'الإسكندرية - السيوف',
        phone: '+20100345678',
        rating: 4.7,
        reviewCount: 312,
        services: ['Battery Service', 'Electrical Repair', 'Suspension'],
        imageUrl: 'https://via.placeholder.com/400x300?text=Workshop+3',
      ),
    ];

    return ApiSuccess(mockData);
  }

  @override
  Future<ApiResult<List<BookingModel>>> getUpcomingBookings() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    final mockData = [
      BookingModel(
        id: 'B001',
        carModel: 'Toyota Corolla 2022',
        serviceType: 'Oil Change & Filter',
        bookingDate: '2024-06-25',
        timeSlot: '10:00 AM',
        status: 'confirmed',
        workshopName: 'أبو علي لصيانة السيارات',
        price: 250.0,
        notes: 'Regular maintenance',
      ),
      BookingModel(
        id: 'B002',
        carModel: 'Honda Civic 2021',
        serviceType: 'Brake Service',
        bookingDate: '2024-06-28',
        timeSlot: '2:00 PM',
        status: 'pending',
        workshopName: 'الصيانة الشاملة',
        price: 450.0,
        notes: 'Brake pads replacement',
      ),
    ];

    return ApiSuccess(mockData);
  }

  @override
  Future<ApiResult<WorkshopModel>> getWorkshopDetails(String workshopId) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    final workshops = {
      '1': WorkshopModel(
        id: '1',
        name: 'أبو علي لصيانة السيارات',
        location: 'القاهرة - مدينة نصر',
        phone: '+20100123456',
        rating: 4.8,
        reviewCount: 245,
        services: ['Oil Change', 'Brake Service', 'Tire Rotation'],
        imageUrl: 'https://via.placeholder.com/400x300?text=Workshop+1',
      ),
      '2': WorkshopModel(
        id: '2',
        name: 'الصيانة الشاملة',
        location: 'الجيزة - الهرم',
        phone: '+20100234567',
        rating: 4.6,
        reviewCount: 189,
        services: ['Engine Repair', 'Transmission', 'AC Service'],
        imageUrl: 'https://via.placeholder.com/400x300?text=Workshop+2',
      ),
    };

    final workshop = workshops[workshopId];
    if (workshop != null) {
      return ApiSuccess(workshop);
    }

    return ApiFailure(
      message: 'Workshop not found',
      statusCode: 404,
    );
  }

  @override
  Future<ApiResult<List<String>>> getAvailableTimeSlots(
    String workshopId,
    DateTime date,
  ) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    const timeSlots = [
      '09:00 AM',
      '10:00 AM',
      '11:00 AM',
      '01:00 PM',
      '02:00 PM',
      '03:00 PM',
      '04:00 PM',
    ];

    return ApiSuccess(timeSlots);
  }
}
