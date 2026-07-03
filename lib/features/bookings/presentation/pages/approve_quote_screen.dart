import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import 'package:warsha_app/features/home_dashboard/presentation/widgets/bottom_branding_logo.dart';
import 'package:warsha_app/features/profile/presentation/pages/payment_methods_screen.dart';
import '../widgets/workshop_pending_card.dart';
import '../widgets/original_booking_card.dart';
import '../widgets/mechanic_extra_card.dart';
import '../widgets/new_total_gradient_card.dart';

class ApproveQuoteScreen extends StatelessWidget {
  const ApproveQuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Approve Quote',
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
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Column(
              children: [
                const WorkshopPendingCard(),
                const SizedBox(height: 16),
                const OriginalBookingCard(),
                const SizedBox(height: 16),
                const MechanicExtraCard(),
                const SizedBox(height: 16),
                const NewTotalGradientCard(),
                const SizedBox(height: 24),

                // 1. Primary Solid Approve Button
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentMethodsScreen(amountDue: 760),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF7905),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                            0xFFFF7905,
                          ).withValues(alpha: 0.25),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      '✓ Approve • 760 EGP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // 2. Secondary Outlined Approve Button
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Original quote approved!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFFFF7905),
                        width: 1.2,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Approve only original (550 EGP)',
                      style: TextStyle(
                        color: Color(0xFFFF7905),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // 3. Shared bottom branding logo
                const BottomBrandingLogo(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
