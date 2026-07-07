import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import 'package:warsha_app/features/home_dashboard/presentation/pages/home_page.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final String serviceName;
  final String carDetails;
  final String workshopName;
  final String date;
  final String time;
  final String amountPaid;

  const PaymentSuccessScreen({
    super.key,
    this.serviceName = 'Oil Change',
    this.carDetails = 'BMW 320i • 2019',
    this.workshopName = 'Bmw Station',
    this.date = 'Tue, 14 May 2026',
    this.time = '10:24 AM',
    this.amountPaid = '760 EGP',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. HEADER: custom Back button
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(initialTab: 0),
                    ),
                    (route) => false,
                  );
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.textDark,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Back',
                      style: TextStyle(
                        color: AppColors.textDark,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      // 2. ICON WITH CONFETTI
                      Center(
                        child: SizedBox(
                          width: 160,
                          height: 160,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Success icon center
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFF2ECC71),
                                    width: 3,
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/icons/checkSucess.png',
                                  width: 64,
                                  height: 64,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.check,
                                      color: Color(0xFF2ECC71),
                                      size: 48,
                                    );
                                  },
                                ),
                              ),
                              // Confetti Dot 1 - Green Top-Left
                              Positioned(
                                left: 24,
                                top: 32,
                                child: _buildConfettiDot(
                                  const Color(0xFF2ECC71),
                                  size: 7,
                                ),
                              ),
                              // Confetti Dot 2 - Orange Top-Right
                              Positioned(
                                right: 28,
                                top: 24,
                                child: _buildConfettiDot(
                                  const Color(0xFFFF7905),
                                  size: 8,
                                ),
                              ),
                              // Confetti Dot 3 - Orange Left-Middle
                              Positioned(
                                left: 16,
                                bottom: 64,
                                child: _buildConfettiDot(
                                  const Color(0xFFFF7905),
                                  size: 5,
                                ),
                              ),
                              // Confetti Dot 4 - Green Right-Middle
                              Positioned(
                                right: 16,
                                bottom: 56,
                                child: _buildConfettiDot(
                                  const Color(0xFF2ECC71),
                                  size: 6,
                                ),
                              ),
                              // Confetti Dot 5 - Green Bottom-Left
                              Positioned(
                                left: 40,
                                bottom: 20,
                                child: _buildConfettiDot(
                                  const Color(0xFF2ECC71),
                                  size: 8,
                                ),
                              ),
                              // Confetti Dot 6 - Orange Bottom-Right
                              Positioned(
                                right: 36,
                                bottom: 24,
                                child: _buildConfettiDot(
                                  const Color(0xFFFF7905),
                                  size: 7,
                                ),
                              ),
                              // Confetti Dot 7 - Orange Top-Center-Left
                              Positioned(
                                left: 64,
                                top: 12,
                                child: _buildConfettiDot(
                                  const Color(0xFFFF7905),
                                  size: 5,
                                ),
                              ),
                              // Confetti Dot 8 - Green Top-Center-Right
                              Positioned(
                                right: 52,
                                top: 16,
                                child: _buildConfettiDot(
                                  const Color(0xFF2ECC71),
                                  size: 8,
                                ),
                              ),
                              // Confetti Dot 9 - Green Left-Middle-High
                              Positioned(
                                left: 12,
                                top: 68,
                                child: _buildConfettiDot(
                                  const Color(0xFF2ECC71),
                                  size: 6,
                                ),
                              ),
                              // Confetti Dot 10 - Orange Right-Middle-High
                              Positioned(
                                right: 10,
                                top: 76,
                                child: _buildConfettiDot(
                                  const Color(0xFFFF7905),
                                  size: 5,
                                ),
                              ),
                              // Confetti Dot 11 - Orange Bottom-Center-Left
                              Positioned(
                                left: 56,
                                bottom: 10,
                                child: _buildConfettiDot(
                                  const Color(0xFFFF7905),
                                  size: 8,
                                ),
                              ),
                              // Confetti Dot 12 - Green Bottom-Center-Right
                              Positioned(
                                right: 68,
                                bottom: 8,
                                child: _buildConfettiDot(
                                  const Color(0xFF2ECC71),
                                  size: 6,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // 3. TEXT LABELS
                      const Text(
                        'Payment Successful!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.textDark,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Your payment has been received\nBooking is confirmed',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 14,
                          height: 1.4,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      const SizedBox(height: 32),

                      // 4. BOOKING SUMMARY CARD
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Booking Summary',
                            style: TextStyle(
                              color: AppColors.textDark,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF7905).withOpacity(0.08),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(0xFFFF7905),
                                width: 1.2,
                              ),
                            ),
                            child: Column(
                              children: [
                                _buildSummaryRow('Service', serviceName),
                                _buildDivider(),
                                _buildSummaryRow('Car', carDetails),
                                _buildDivider(),
                                _buildSummaryRow('Workshop', workshopName),
                                _buildDivider(),
                                _buildSummaryRow('Date', date),
                                _buildDivider(),
                                _buildSummaryRow('Time', time),
                                _buildDivider(),
                                _buildSummaryRow(
                                  'Amount Paid',
                                  amountPaid,
                                  isPaidAmount: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),

              // 5. BOTTOM ACTIONS
              GestureDetector(
                onTap: () {
                  // Route to Bookings tab of HomePage (initialTab: 2)
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(initialTab: 2),
                    ),
                    (route) => false,
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
                        color: const Color(0xFFFF7905).withOpacity(0.25),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'View Booking',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(initialTab: 0),
                      ),
                      (route) => false,
                    );
                  },
                  child: const Text(
                    'Back to Home',
                    style: TextStyle(
                      color: Color(0xFFFF7905),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConfettiDot(Color color, {double size = 7}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value, {
    bool isPaidAmount = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textGrey,
              fontSize: 13,
              fontFamily: 'Roboto',
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: isPaidAmount
                  ? const Color(0xFFFF7905)
                  : AppColors.textDark,
              fontSize: isPaidAmount ? 15 : 13,
              fontWeight: isPaidAmount ? FontWeight.bold : FontWeight.w600,
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Divider(color: Colors.black12, height: 1, thickness: 0.8),
    );
  }
}
