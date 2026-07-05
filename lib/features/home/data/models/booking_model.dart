import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/booking_entity.dart';

part 'booking_model.g.dart';

/// BookingModel is the data model for Booking entity
@JsonSerializable()
class BookingModel {
  final String id;
  @JsonKey(name: 'car_model')
  final String carModel;
  @JsonKey(name: 'service_type')
  final String serviceType;
  @JsonKey(name: 'booking_date')
  final String bookingDate;
  @JsonKey(name: 'time_slot')
  final String timeSlot;
  final String status;
  @JsonKey(name: 'workshop_name')
  final String workshopName;
  final double price;
  final String notes;

  BookingModel({
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

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingModelToJson(this);

  /// Convert to domain entity
  Booking toEntity() => Booking(
        id: id,
        carModel: carModel,
        serviceType: serviceType,
        bookingDate: DateTime.parse(bookingDate),
        timeSlot: timeSlot,
        status: status,
        workshopName: workshopName,
        price: price,
        notes: notes,
      );
}
