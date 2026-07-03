import 'package:flutter/material.dart';

class PayWithWalletsBottomSheet extends StatefulWidget {
  final int amountDue;
  final VoidCallback onPaymentSuccess;

  const PayWithWalletsBottomSheet({
    super.key,
    required this.amountDue,
    required this.onPaymentSuccess,
  });

  @override
  State<PayWithWalletsBottomSheet> createState() =>
      _PayWithWalletsBottomSheetState();
}

class _PayWithWalletsBottomSheetState extends State<PayWithWalletsBottomSheet> {
  int _selectedWallet = 0; // 0: Vodafone, 1: Etisalat, 2: Orange, 3: WE Pay

  static const List<Map<String, String>> _wallets = [
    {'name': 'Vodafone Cash', 'asset': 'assets/images/vodafone.png'},
    {'name': 'Etisalat Cash', 'asset': 'assets/images/eitsalat.png'},
    {'name': 'Orange Cash', 'asset': 'assets/images/orange.png'},
    {'name': 'WE Pay', 'asset': 'assets/images/we.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(
              0xFFFF7905,
            ).withValues(alpha: 0.45), // 45% orange blend top
            const Color(0xFF1E1417), // Deep dark shade base
          ],
          stops: const [0.0, 0.75],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Pay with Wallets',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Wallet Selection List
            for (int i = 0; i < _wallets.length; i++) ...[
              GestureDetector(
                onTap: () => setState(() => _selectedWallet = i),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.04),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: _selectedWallet == i
                          ? const Color(0xFFFF7905)
                          : Colors.white12,
                      width: _selectedWallet == i ? 1.5 : 1.0,
                    ),
                  ),
                  child: Row(
                    children: [
                      // Wallet Logo
                      Image.asset(
                        _wallets[i]['asset']!,
                        width: 32,
                        height: 32,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                              color: Colors.white10,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.wallet_outlined,
                              color: Colors.white70,
                              size: 16,
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 14),
                      // Wallet Name
                      Expanded(
                        child: Text(
                          _wallets[i]['name']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                      // Chevron right
                      const Icon(
                        Icons.chevron_right,
                        color: Colors.white70,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
            const SizedBox(height: 16),

            // Phone Number Form Field
            const Text(
              'Phone Number',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            TextField(
              style: const TextStyle(color: Colors.white, fontSize: 15),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: '01234567891',
                hintStyle: const TextStyle(color: Colors.white38, fontSize: 14),
                suffixIcon: const Icon(
                  Icons.contact_phone_outlined,
                  color: Color(0xFFFF7905),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                fillColor: Colors.white.withValues(alpha: 0.05),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white24),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xFFFF7905),
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white24),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Action Continue Button
            GestureDetector(
              onTap: () {
                Navigator.pop(context); // Close bottom sheet
                widget.onPaymentSuccess();
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
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
