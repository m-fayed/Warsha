import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class WelcomeInfoAndActions extends StatelessWidget {
  final bool isMobile;
  final VoidCallback onGetStarted;
  final VoidCallback onLogin;

  const WelcomeInfoAndActions({
    super.key,
    required this.isMobile,
    required this.onGetStarted,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 32,
          vertical: 12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Title
            Text(
              'Your car,\nin trusted hands.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 26 : 30,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                height: 1.3,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 12),

            // Subtitle
            Text(
              'Find verified mechanics, fair prices,\nand never miss a service again.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 13 : 15,
                fontWeight: FontWeight.w400,
                color: Colors.white.withValues(alpha: 0.75),
                height: 1.5,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 24),

            // Get Started Button
            GestureDetector(
              onTap: onGetStarted,
              child: Container(
                width: double.infinity,
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.18),
                      blurRadius: 14,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Get started',
                        style: TextStyle(
                          fontSize: isMobile ? 15 : 17,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryGold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.arrow_forward_rounded,
                        size: 18,
                        color: AppColors.primaryOrange,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),

            // Already have an account link
            GestureDetector(
              onTap: onLogin,
              child: Text(
                'Already have an account? \n Log in',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withValues(alpha: 0.8),
                  fontFamily: 'Roboto',
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white.withValues(alpha: 0.8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
