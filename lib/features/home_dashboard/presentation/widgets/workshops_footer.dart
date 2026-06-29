import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class WorkshopsFooter extends StatelessWidget {
  const WorkshopsFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 8, bottom: 12),
      color: Colors.white,
      child: const Center(
        child: Text(
          'Showing workshops that serves \n your car',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.primaryOrange,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto',
          ),
        ),
      ),
    );
  }
}
