import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warsha_app/core/config/service_locator.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import 'package:warsha_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:warsha_app/features/auth/presentation/screens/login_screen.dart';
import 'package:warsha_app/features/auth/presentation/screens/add_car_and_plates_screen.dart';
import 'package:warsha_app/features/auth/presentation/widgets/register_header.dart';
import 'package:warsha_app/features/auth/presentation/widgets/register_form.dart';

/// RegisterScreen allows new users to create an account with Warsha with responsive, overflow-safe layout
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.lightBg,
        appBar: AppBar(
          backgroundColor: AppColors.lightBg,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.textDark,
            ),
            onPressed: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        body: SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              physics: const BouncingScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Header design with logo and title
                    const RegisterHeader(
                      title: 'Create Account',
                      subtitle: 'Sign up to get started with Warsha',
                    ),
                    const SizedBox(height: 24),

                    // Modular Input Fields & Form Actions
                    RegisterForm(
                      onLoginTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      onRegisterSuccess: () {
                        // Navigate to car setup after successful registration
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const AddCarAndPlatesScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
