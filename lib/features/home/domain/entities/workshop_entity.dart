import 'package:equatable/equatable.dart';

/// Workshop entity representing a car maintenance workshop
class Workshop extends Equatable {
  final String id;
  final String name;
  final String location;
  final String phone;
  final double rating;
  final int reviewCount;
  final List<String> services;
  final String imageUrl;

  const Workshop({
    required this.id,
    required this.name,
    required this.location,
    required this.phone,
    required this.rating,
    required this.reviewCount,
    required this.services,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        location,
        phone,
        rating,
        reviewCount,
        services,
        imageUrl,
      ];
}
