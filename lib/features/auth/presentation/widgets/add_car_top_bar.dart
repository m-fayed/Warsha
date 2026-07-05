import 'package:flutter/material.dart';
import 'package:warsha_app/features/home_dashboard/presentation/pages/home_page.dart';

class AddCarTopBar extends StatelessWidget {
  final bool isFromProfile;

  const AddCarTopBar({super.key, required this.isFromProfile});

  @override
  Widget build(BuildContext context) {
    if (isFromProfile) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: Colors.grey,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            const Text(
              'Back',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Step 2 of 2',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false,
              );
            },
            child: const Text(
              'Skip >',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
