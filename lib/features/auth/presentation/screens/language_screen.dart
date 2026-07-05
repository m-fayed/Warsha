import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warsha_app/features/auth/presentation/cubit/language_cubit.dart';
import 'package:warsha_app/features/auth/presentation/screens/phone_otp_screen.dart';
import '../widgets/language_flags.dart';
import '../widgets/language_card.dart';

/// LanguageScreen allows the user to select their preferred language.
class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            final currentLanguage = state.locale.languageCode;

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top Section with Title and Selection Cards
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 24),
                          const Text(
                            'Choose Your Language',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Roboto',
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Select your preferred language to customize your experience',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                              fontFamily: 'Roboto',
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 48),

                          // Language Selector Cards
                          LanguageCard(
                            languageName: 'العربية (Arabic)',
                            flagWidget: const EgyptFlag(),
                            isSelected: currentLanguage == 'ar',
                            onTap: () {
                              context.read<LanguageCubit>().changeLanguage('ar');
                            },
                          ),
                          const SizedBox(height: 16),
                          LanguageCard(
                            languageName: 'English (US/UK)',
                            flagWidget: const UsFlag(),
                            isSelected: currentLanguage == 'en',
                            onTap: () {
                              context.read<LanguageCubit>().changeLanguage('en');
                            },
                          ),
                          const SizedBox(height: 16),
                          LanguageCard(
                            languageName: 'Français (French)',
                            flagWidget: const FranceFlag(),
                            isSelected: currentLanguage == 'fr',
                            onTap: () {
                              context.read<LanguageCubit>().changeLanguage('fr');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Bottom Section: CTA & Logo Branding
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const PhoneOtpScreen()),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 56,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF6B00), // Vibrant Orange
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFFF6B00).withValues(alpha: 0.25),
                                blurRadius: 16,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Hero(
                        tag: 'app_logo',
                        child: SizedBox(
                          width: 70,
                          height: 70,
                          child: Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.build_circle_rounded,
                                size: 40,
                                color: Color(0xFFFF6B00),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
