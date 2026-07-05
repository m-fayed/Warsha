import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class BottomBrandingLogo extends StatelessWidget {
  final double width;
  final double height;

  const BottomBrandingLogo({
    super.key,
    this.width = 180,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/logo.png',
        width: width,
        height: height,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Icon(
            Icons.car_repair,
            size: height * 0.8,
            color: AppColors.primaryOrange,
          );
        },
      ),
    );
  }
}
