import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class BookedCarAndServiceCard extends StatelessWidget {
  final String carBrand;
  final String carSpecs;
  final String carColorTag;
  final String servicePrice;
  final String serviceDescription;

  const BookedCarAndServiceCard({
    super.key,
    this.carBrand = 'Bmw 320i',
    this.carSpecs = '2017',
    this.carColorTag = 'White',
    this.servicePrice = '1750 EGP',
    this.serviceDescription = 'Mobile 10k - 5W-30',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0x1FFF7905), // Figma Hex #FF79051F
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFFF7905), width: 1.0), // Orange border
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Car Details row
          Row(
            children: [
              // Image placeholder
              Container(
                width: 60,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  'assets/images/car.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.directions_car,
                      color: Color(0xFFFF7905),
                      size: 24,
                    );
                  },
                ),
              ),
              const SizedBox(width: 16),
              // Car brand / year / white color tag
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$carBrand ($carSpecs)',
                      style: const TextStyle(
                        color: Color(0xFF1A1A1A),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 4),
                    // "White" Gray Tag
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        carColorTag,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 11,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Divider(
              color: Colors.black12,
              height: 1,
            ),
          ),
          // 2. Service details row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Service details',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    serviceDescription,
                    style: const TextStyle(
                      color: Color(0xFF1A1A1A),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
              // Orange Price
              Text(
                servicePrice,
                style: const TextStyle(
                  color: AppColors.primaryOrange,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
