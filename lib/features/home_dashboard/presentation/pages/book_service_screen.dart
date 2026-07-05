import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import '../widgets/service_item_card.dart';
import '../widgets/bottom_branding_logo.dart';
import 'booking_confirmed_screen.dart';

class ServiceData {
  final String serviceName;
  final int price;
  final IconData icon;

  const ServiceData({
    required this.serviceName,
    required this.price,
    required this.icon,
  });
}

class BookServiceScreen extends StatelessWidget {
  final String workshopName;

  const BookServiceScreen({super.key, required this.workshopName});

  static const List<ServiceData> _services = [
    ServiceData(
      serviceName: 'Oil change',
      price: 1800,
      icon: Icons.oil_barrel_outlined,
    ),
    ServiceData(
      serviceName: 'Full service',
      price: 20000,
      icon: Icons.build_circle_outlined,
    ),
    ServiceData(
      serviceName: 'Battery change',
      price: 2000,
      icon: Icons.battery_charging_full_outlined,
    ),
    ServiceData(
      serviceName: 'AC Service',
      price: 700,
      icon: Icons.ac_unit_outlined,
    ),
    ServiceData(
      serviceName: 'Brake inspection',
      price: 200,
      icon: Icons.search_outlined,
    ),
    ServiceData(
      serviceName: 'Brake Change',
      price: 200,
      icon: Icons.car_repair_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Book Service',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.grey,
            size: 18,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Booking at $workshopName',
                    style: const TextStyle(
                      color: AppColors.textGrey,
                      fontSize: 14,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Dynamic service cards
                  for (final service in _services) ...[
                    ServiceItemCard(
                      serviceName: service.serviceName,
                      price: service.price,
                      icon: service.icon,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BookingConfirmedScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                  ],
                  const Spacer(),
                  const SizedBox(height: 32),
                  const BottomBrandingLogo(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
