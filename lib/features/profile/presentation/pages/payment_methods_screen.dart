import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import '../widgets/payment_methods_app_bar.dart';
import '../widgets/payment_option_card.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PaymentMethodsAppBar(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Credit/Debit Card Option
                  const PaymentOptionCard(
                    title: 'Credit/Debit Card',
                    icon: Icons.credit_card_outlined,
                  ),
                  const SizedBox(height: 16),

                  // 2. Cash Option
                  const PaymentOptionCard(
                    title: 'Cash',
                    icon: Icons.attach_money_outlined,
                  ),
                  const SizedBox(height: 16),

                  // 3. Wallet, Fawry, Instapay Option
                  const PaymentOptionCard(
                    title: 'Wallet, Fawry, Instapay',
                    icon: Icons.account_balance_wallet_outlined,
                  ),
                  
                  // Push logo to the absolute bottom
                  const Spacer(),
                  const SizedBox(height: 32),

                  // Centered bold brand logo
                  Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 180,
                      height: 100,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.car_repair,
                          size: 80,
                          color: AppColors.primaryOrange,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
