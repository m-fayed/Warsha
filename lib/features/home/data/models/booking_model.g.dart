// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) => BookingModel(
  id: json['id'] as String,
  carModel: json['car_model'] as String,
  serviceType: json['service_type'] as String,
  bookingDate: json['booking_date'] as String,
  timeSlot: json['time_slot'] as String,
  status: json['status'] as String,
  workshopName: json['workshop_name'] as String,
  price: (json['price'] as num).toDouble(),
  notes: json['notes'] as String,
);

Map<String, dynamic> _$BookingModelToJson(BookingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'car_model': instance.carModel,
      'service_type': instance.serviceType,
      'booking_date': instance.bookingDate,
      'time_slot': instance.timeSlot,
      'status': instance.status,
      'workshop_name': instance.workshopName,
      'price': instance.price,
      'notes': instance.notes,
    };
