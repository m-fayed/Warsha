import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warsha_app/core/config/service_locator.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import 'package:warsha_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:warsha_app/features/auth/presentation/screens/register_screen.dart';
import 'package:warsha_app/features/auth/presentation/widgets/auth_header.dart';
import 'package:warsha_app/features/auth/presentation/widgets/login_form.dart';
import 'package:warsha_app/features/auth/presentation/screens/add_car_and_plates_screen.dart';

/// LoginScreen allows existing users to log into Warsha with responsive, overflow-safe layout
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                    // Prominent logo header design
                    const AuthHeader(
                      title: 'Welcome Back',
                      subtitle: 'Login to continue with Warsha',
                    ),
                    const SizedBox(height: 24),

                    // Login Form Fields & Action Buttons
                    LoginForm(
                      onRegisterTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                      onLoginSuccess: () {
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
