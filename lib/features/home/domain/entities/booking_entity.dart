import 'package:equatable/equatable.dart';

/// Booking entity representing a car maintenance booking
class Booking extends Equatable {
  final String id;
  final String carModel;
  final String serviceType;
  final DateTime bookingDate;
  final String timeSlot;
  final String status;
  final String workshopName;
  final double price;
  final String notes;

  const Booking({
    required this.id,
    required this.carModel,
    required this.serviceType,
    required this.bookingDate,
    required this.timeSlot,
    required this.status,
    required this.workshopName,
    required this.price,
    required this.notes,
  });

  @override
  List<Object?> get props => [
        id,
        carModel,
        serviceType,
        bookingDate,
        timeSlot,
        status,
        workshopName,
        price,
        notes,
      ];
}
