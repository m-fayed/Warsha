import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import '../widgets/history_custom_app_bar.dart';
import '../widgets/history_top_car_card.dart';
import '../widgets/history_triple_stat_cards.dart';
import '../widgets/history_service_card.dart';

/// Data model for service history items
class ServiceHistoryItem {
  final String title;
  final String subtitle;
  final String spent;
  final String kilometers;

  const ServiceHistoryItem({
    required this.title,
    required this.subtitle,
    required this.spent,
    required this.kilometers,
  });
}

/// CarHistoryScreen displays the vehicle maintenance history
/// with statistics and service records
class CarHistoryScreen extends StatelessWidget {
  const CarHistoryScreen({super.key});

  // Sample data - in real app this would come from a repository/cubit
  static const List<ServiceHistoryItem> _serviceHistory = [
    ServiceHistoryItem(
      title: 'Oil change',
      subtitle: 'At Bmw Station',
      spent: '3000',
      kilometers: '127,000',
    ),
    ServiceHistoryItem(
      title: 'Tire rotation',
      subtitle: 'At Bmw Station',
      spent: '1500',
      kilometers: '120,000',
    ),
    ServiceHistoryItem(
      title: 'Brake pads',
      subtitle: 'At AutoZone',
      spent: '4500',
      kilometers: '115,000',
    ),
    ServiceHistoryItem(
      title: 'Battery replacement',
      subtitle: 'At Bmw Club',
      spent: '2800',
      kilometers: '110,000',
    ),
    ServiceHistoryItem(
      title: 'AC service',
      subtitle: 'At CoolAir',
      spent: '1200',
      kilometers: '105,000',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const HistoryCustomAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Car Card
              const HistoryTopCarCard(
                brand: 'Bmw: 320i',
                specs: '2017  2.0L',
                license: 'License: 123/ART',
                imagePath: 'assets/images/car.png',
              ),
              const SizedBox(height: 20),

              // Triple Statistical Cards
              const HistoryTripleStatCards(
                totalServices: '32',
                totalSpent: '120,000',
                sinceYear: '2026',
              ),
              const SizedBox(height: 24),

              // Last Service Section Header
              const Text(
                'Last Service',
                style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 16),

              // Service History List
              ..._serviceHistory.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: HistoryServiceCard(
                    title: item.title,
                    subtitle: item.subtitle,
                    spent: item.spent,
                    kilometers: item.kilometers,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}