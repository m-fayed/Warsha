import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/workshop_entity.dart';

part 'workshop_model.g.dart';

/// WorkshopModel is the data model for Workshop entity
@JsonSerializable()
class WorkshopModel {
  final String id;
  final String name;
  final String location;
  final String phone;
  final double rating;
  @JsonKey(name: 'review_count')
  final int reviewCount;
  final List<String> services;
  @JsonKey(name: 'image_url')
  final String imageUrl;

  WorkshopModel({
    required this.id,
    required this.name,
    required this.location,
    required this.phone,
    required this.rating,
    required this.reviewCount,
    required this.services,
    required this.imageUrl,
  });

  factory WorkshopModel.fromJson(Map<String, dynamic> json) =>
      _$WorkshopModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkshopModelToJson(this);

  /// Convert to domain entity
  Workshop toEntity() => Workshop(
        id: id,
        name: name,
        location: location,
        phone: phone,
        rating: rating,
        reviewCount: reviewCount,
        services: services,
        imageUrl: imageUrl,
      );
}
