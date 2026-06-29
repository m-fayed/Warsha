// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workshop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkshopModel _$WorkshopModelFromJson(Map<String, dynamic> json) =>
    WorkshopModel(
      id: json['id'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      phone: json['phone'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviewCount: (json['review_count'] as num).toInt(),
      services: (json['services'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$WorkshopModelToJson(WorkshopModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'phone': instance.phone,
      'rating': instance.rating,
      'review_count': instance.reviewCount,
      'services': instance.services,
      'image_url': instance.imageUrl,
    };
