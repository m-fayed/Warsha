import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import 'package:warsha_app/features/profile/presentation/pages/edit_profile_screen.dart';
import 'package:warsha_app/features/profile/presentation/pages/help_support_screen.dart';
import 'package:warsha_app/features/profile/presentation/pages/notifications_screen.dart';
import 'package:warsha_app/features/profile/presentation/pages/my_cars_screen.dart';
import 'package:warsha_app/features/profile/presentation/pages/payment_methods_screen.dart';
import 'package:warsha_app/features/profile/presentation/widgets/profile_header_card.dart';
import 'package:warsha_app/features/profile/presentation/widgets/profile_menu_card.dart';
import 'package:warsha_app/features/profile/presentation/widgets/logout_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. MAIN PROFILE CARD
              ProfileHeaderCard(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EditProfileScreen()),
                  );
                },
              ),
              const SizedBox(height: 24),

              // 2. ACCOUNT SECTION
              const Text(
                'Account',
                style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 12),
              ProfileMenuCard(
                icon: Icons.directions_car_outlined,
                title: 'My cars',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyCarsScreen()),
                  );
                },
              ),
              const SizedBox(height: 10),
              ProfileMenuCard(
                icon: Icons.credit_card_outlined,
                title: 'Payment methods',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PaymentMethodsScreen()),
                  );
                },
              ),
              const SizedBox(height: 10),
              ProfileMenuCard(
                icon: Icons.favorite_border,
                title: 'Saved Workshops',
                onTap: () {},
              ),
              const SizedBox(height: 24),

              // 3. PREFERENCES SECTION
              const Text(
                'Preferences',
                style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 12),
              ProfileMenuCard(
                icon: Icons.language_outlined,
                title: 'Language',
                trailing: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'English',
                      style: TextStyle(color: AppColors.textGrey, fontSize: 14, fontFamily: 'Roboto'),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.chevron_right, color: AppColors.textGrey, size: 20),
                  ],
                ),
                onTap: () {},
              ),
              const SizedBox(height: 10),
              ProfileMenuCard(
                icon: Icons.notifications_none_outlined,
                title: 'Notifications',
                trailing: Switch(
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                  activeColor: AppColors.primaryOrange,
                  activeTrackColor: AppColors.primaryOrangeLight.withOpacity(0.5),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NotificationsScreen()),
                  );
                },
              ),
              const SizedBox(height: 10),
              ProfileMenuCard(
                icon: Icons.help_outline,
                title: 'Help & Support',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HelpSupportScreen()),
                  );
                },
              ),
              const SizedBox(height: 32),

              // 4. LOGOUT BUTTON
              LogoutButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logged out successfully')),
                  );
                },
              ),
              const SizedBox(height: 32),

              // 5. FOOTER BRANDING LOGO
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 180,
                  height: 100,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.car_repair, size: 80, color: AppColors.primaryOrange);
                  },
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