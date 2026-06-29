import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import 'package:warsha_app/features/auth/presentation/screens/add_car_and_plates_screen.dart';
import 'package:warsha_app/features/profile/presentation/widgets/car_data.dart';
import 'package:warsha_app/features/profile/presentation/widgets/dark_car_info_card.dart';
import 'package:warsha_app/features/profile/presentation/widgets/dark_live_car_status_card.dart';

class MyCarsScreen extends StatefulWidget {
  const MyCarsScreen({super.key});

  @override
  State<MyCarsScreen> createState() => _MyCarsScreenState();
}

class _MyCarsScreenState extends State<MyCarsScreen> {
  final List<CarData> _cars = [
    CarData(
      brand: 'Bmw: 320i',
      specs: '2017  2.0L',
      license: 'License: 123/ART',
      imagePath: 'assets/images/car.png',
    ),
    CarData(
      brand: 'Bmw: 320i',
      specs: '2017  2.0L',
      license: 'License: 123/ART',
      imagePath: 'assets/images/car.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Cars',
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_cars.isNotEmpty)
                DarkCarInfoCard(
                  brand: _cars[0].brand,
                  specs: _cars[0].specs,
                  license: _cars[0].license,
                  imagePath: _cars[0].imagePath,
                ),
              const SizedBox(height: 16),
              const DarkLiveCarStatusCard(
                range: 'Car range: 137,000km',
                health: 'Car health status: Good',
                nextService: 'Next service: Oil change in 3,000km',
                imagePath: 'assets/images/car.png',
              ),
              const SizedBox(height: 16),
              for (int i = 1; i < _cars.length; i++) ...[
                DarkCarInfoCard(
                  brand: _cars[i].brand,
                  specs: _cars[i].specs,
                  license: _cars[i].license,
                  imagePath: _cars[i].imagePath,
                ),
                const SizedBox(height: 16),
              ],
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const AddCarAndPlatesScreen(isFromProfile: true),
                      ),
                    );

                    if (result != null && result is Map<String, dynamic>) {
                      setState(() {
                        _cars.add(
                          CarData(
                            brand:
                                "${result['brand'] ?? 'Bmw'}: ${result['model'] ?? '320i'}",
                            specs:
                                "${result['year'] ?? '2017'}  ${result['specs'] ?? '2.0L'}",
                            license: result['license'] ?? 'License: 789/XYZ',
                            imagePath: 'assets/images/car.png',
                          ),
                        );
                      });
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.green, width: 1.5),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                  child: const Text(
                    'Add car',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 180,
                  height: 100,
                  fit: BoxFit.contain,
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
