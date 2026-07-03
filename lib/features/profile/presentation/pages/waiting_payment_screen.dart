import 'dart:async';
import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import 'package:warsha_app/features/home_dashboard/presentation/pages/home_page.dart';
import 'package:warsha_app/features/home_dashboard/presentation/widgets/bottom_branding_logo.dart';

class WaitingPaymentScreen extends StatefulWidget {
  const WaitingPaymentScreen({super.key});

  @override
  State<WaitingPaymentScreen> createState() => _WaitingPaymentScreenState();
}

class _WaitingPaymentScreenState extends State<WaitingPaymentScreen> {
  int _secondsRemaining = 139; // Starting from 02:19 matching Figma design
  bool _isExpired = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _isExpired = true;
        });
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatDuration(int totalSeconds) {
    final int minutes = totalSeconds ~/ 60;
    final int seconds = totalSeconds % 60;
    final String minutesStr = minutes.toString().padLeft(2, '0');
    final String secondsStr = seconds.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.grey),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [
              const Spacer(),

              // 1. Center Circle (Dynamic phone checkmark VS warning error icon)
              Center(
                child: _isExpired
                    ? Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          color: Colors.red.withValues(alpha: 0.12),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.red.withValues(alpha: 0.25),
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.error_outline_rounded,
                          size: 72,
                          color: Colors.red,
                        ),
                      )
                    : Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF7905).withValues(alpha: 0.12),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFFF7905).withValues(alpha: 0.25),
                            width: 2,
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Phone Icon
                            const Icon(
                              Icons.phone_android_outlined,
                              size: 64,
                              color: Color(0xFFFF7905),
                            ),
                            // Checkmark bubble on top right
                            Positioned(
                              right: 32,
                              top: 32,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
              const SizedBox(height: 32),

              // 2. Info text description (Dynamic check VS timeout error states)
              _isExpired
                  ? const Column(
                      children: [
                        Text(
                          'Payment Request Expired',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "We didn't receive the payment in time. Please try again.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.textGrey,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
                    )
                  : const Text(
                      'Approve the payment request on your phone.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textDark,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),

              // 3. Live Countdown Timer layout (Hidden on expiration)
              if (!_isExpired) ...[
                const SizedBox(height: 16),
                Text(
                  _formatDuration(_secondsRemaining),
                  style: const TextStyle(
                    color: Color(0xFFFF7905),
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    letterSpacing: 1.5,
                  ),
                ),
              ],

              const Spacer(),

              // 4. Bottom controls actions buttons (Dynamic Try Again VS Refresh)
              Column(
                children: [
                  _isExpired
                      ? GestureDetector(
                          onTap: () => Navigator.of(context).pop(), // Pop to PaymentMethodsScreen
                          child: Container(
                            width: double.infinity,
                            height: 56,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF7905), // Primary orange Try Again CTA
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
                              'Try Again',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Payment confirmed successfully!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                            // Route back to main home page
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                              (route) => false,
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 54,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100, // Light white-grey background
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1.2,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'Refresh Status',
                              style: TextStyle(
                                color: AppColors.textDark,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(height: 12),

                  // Cancel Payment Button (Red Border)
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Payment request cancelled.'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      Navigator.of(context).pop(); // Go back to payment page
                    },
                    child: Container(
                      width: double.infinity,
                      height: 54,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.red,
                          width: 1.5,
                        ), // Red border
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Cancel Payment',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Branding logo
                  const BottomBrandingLogo(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
