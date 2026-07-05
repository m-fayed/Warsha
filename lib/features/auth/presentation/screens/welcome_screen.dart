import 'package:flutter/material.dart';
import 'package:warsha_app/features/auth/presentation/screens/language_screen.dart';
import 'package:warsha_app/features/auth/presentation/screens/phone_otp_screen.dart';
import '../widgets/welcome_background.dart';
import '../widgets/welcome_composite_header.dart';
import '../widgets/welcome_info_and_actions.dart';

/// WelcomeScreen displays the polished onboarding experience for Warsha
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 600;

    return Scaffold(
      body: Stack(
        children: [
          // Rich gradient background
          const WelcomeBackground(),

          // Main content with safe area
          SafeArea(
            child: Column(
              children: [
                // Top section: Composite background asset image
                const Expanded(flex: 2, child: WelcomeCompositeHeader()),

                // Bottom section: Title, subtitle, button, and login link
                Expanded(
                  flex: 1,
                  child: WelcomeInfoAndActions(
                    isMobile: isMobile,
                    onGetStarted: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LanguageScreen(),
                        ),
                      );
                    },
                    onLogin: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const PhoneOtpScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
