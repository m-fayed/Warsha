import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import 'package:warsha_app/features/home_dashboard/presentation/pages/home_page.dart';
import 'package:warsha_app/features/home_dashboard/presentation/pages/booking_confirmed_screen.dart';
import 'package:warsha_app/features/profile/presentation/widgets/pay_with_card_bottom_sheet.dart';
import 'package:warsha_app/features/profile/presentation/widgets/pay_with_instapay_bottom_sheet.dart';
import 'package:warsha_app/features/profile/presentation/widgets/fawry_payment_bottom_sheet.dart';
import 'package:warsha_app/features/profile/presentation/widgets/pay_with_wallets_bottom_sheet.dart';
import 'package:warsha_app/features/profile/presentation/pages/waiting_payment_screen.dart';
import '../widgets/payment_method_tile.dart';

class PaymentMethodsScreen extends StatefulWidget {
  final int amountDue;

  const PaymentMethodsScreen({
    super.key,
    this.amountDue = 760,
  });

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  int _selectedMethod = 0; // 0: Credit card, 1: Instapay, 2: Fawry, 3: Wallet, 4: Cash

  static const List<Map<String, String>> _methods = [
    {
      'title': 'Credit / Debit card',
      'subtitle': 'Visa, master card, Meeza',
      'asset': 'assets/images/credit.png',
    },
    {
      'title': 'Instapay',
      'subtitle': 'Instant back transfer',
      'asset': 'assets/images/instapay.png',
    },
    {
      'title': 'Fawry',
      'subtitle': 'Pay through fawry app',
      'asset': 'assets/images/fawry.png',
    },
    {
      'title': 'Wallet',
      'subtitle': 'Vodafone Cash, Orange cash & more',
      'asset': 'assets/images/wallet.png',
    },
    {
      'title': 'Cash',
      'subtitle': 'Pay at the workshop',
      'asset': 'assets/images/cash.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Payment',
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Amount Due Banner
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF7905), // Primary orange
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Amount Due',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      Text(
                        '${widget.amountDue} EGP',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // 2. Title Label
                const Text(
                  'Choose payment method',
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 16),

                // 3. Payment Option Tiles List
                for (int i = 0; i < _methods.length; i++) ...[
                  PaymentMethodTile(
                    title: _methods[i]['title']!,
                    subtitle: _methods[i]['subtitle']!,
                    assetPath: _methods[i]['asset']!,
                    isSelected: _selectedMethod == i,
                    onTap: () {
                      setState(() => _selectedMethod = i);
                      if (i == 0) {
                        _showCardBottomSheet(context);
                      } else if (i == 1) {
                        _showInstapayBottomSheet(context);
                      } else if (i == 2) {
                        _showFawryBottomSheet(context);
                      } else if (i == 3) {
                        _showWalletsBottomSheet(context);
                      }
                    },
                  ),
                ],
                const SizedBox(height: 48), // Padding pushed down further for vertical balance

                // 4. Continue Button
                 GestureDetector(
                  onTap: () {
                    if (_selectedMethod == 0) {
                      _showCardBottomSheet(context);
                    } else if (_selectedMethod == 1) {
                      _showInstapayBottomSheet(context);
                    } else if (_selectedMethod == 2) {
                      _showFawryBottomSheet(context);
                    } else if (_selectedMethod == 3) {
                      _showWalletsBottomSheet(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Booking confirmed! You will pay at the workshop.',
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                      // Navigate directly to BookingConfirmedScreen
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => const BookingConfirmedScreen()),
                        (route) => false,
                      );
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF7905),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFF7905).withValues(alpha: 0.25),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const Text(
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
                const SizedBox(height: 32),

                // 5. Shared Bottom Branding Logo
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
                        color: Color(0xFFFF7905),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCardBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PayWithCardBottomSheet(
        amountDue: widget.amountDue,
        onPaymentSuccess: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WaitingPaymentScreen()),
          );
        },
      ),
    );
  }

  void _showInstapayBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PayWithInstapayBottomSheet(
        amountDue: widget.amountDue,
      ),
    );
  }

  void _showFawryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FawryPaymentBottomSheet(
        amountDue: widget.amountDue,
      ),
    );
  }

  void _showWalletsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PayWithWalletsBottomSheet(
        amountDue: widget.amountDue,
        onPaymentSuccess: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WaitingPaymentScreen()),
          );
        },
      ),
    );
  }
}
