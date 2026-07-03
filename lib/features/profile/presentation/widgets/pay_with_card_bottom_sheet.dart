import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    // Strip all non-digits (including spaces)
    text = text.replaceAll(RegExp(r'\D'), '');

    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      final nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write(' ');
      }
    }

    final string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

class PayWithCardBottomSheet extends StatefulWidget {
  final int amountDue;
  final VoidCallback onPaymentSuccess;

  const PayWithCardBottomSheet({
    super.key,
    required this.amountDue,
    required this.onPaymentSuccess,
  });

  @override
  State<PayWithCardBottomSheet> createState() => _PayWithCardBottomSheetState();
}

class _PayWithCardBottomSheetState extends State<PayWithCardBottomSheet> {
  bool _saveCard = true;

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
            color: Colors.black.withValues(
              alpha: 0.4,
            ), // Darker overlay shadow (40% opacity)
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle indicator
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
                  'Pay with card',
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
            const SizedBox(height: 20),

            // Card number field (Auto formats + Max length 19)
            _buildTextField(
              label: 'Card number',
              hint: '0000 0000 0000 0000',
              inputFormatters: [CardNumberFormatter()],
              maxLength: 19,
              suffixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/images/visa.png',
                  width: 32,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.credit_card_outlined,
                      color: Colors.white70,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Card Holder field
            _buildTextField(label: 'Card Holder', hint: 'Name on card'),
            const SizedBox(height: 16),

            // Expiry date and CVV Row
            Row(
              children: [
                Expanded(
                  child: _buildTextField(label: 'Expiry date', hint: 'MM/YY'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(label: 'CVV', hint: '123'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Save card checkbox
            GestureDetector(
              onTap: () => setState(() => _saveCard = !_saveCard),
              child: Row(
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: _saveCard
                          ? const Color(0xFFFF7905)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: const Color(0xFFFF7905),
                        width: 1.5,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: _saveCard
                        ? const Icon(Icons.check, size: 14, color: Colors.white)
                        : null,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'save the card',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Action Pay Button
            GestureDetector(
              onTap: () {
                Navigator.pop(context); // Close bottom sheet
                widget.onPaymentSuccess();
              },
              child: Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF7905), // Primary orange
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
                child: Text(
                  'Pay ${widget.amountDue} EGP',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Secure Encryption note footer
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock_outline_rounded,
                  color: Colors.white54,
                  size: 15,
                ),
                SizedBox(width: 6),
                Text(
                  'Your payment is secured and encrypted',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    Widget? suffixIcon,
    List<TextInputFormatter>? inputFormatters,
    int? maxLength,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          style: const TextStyle(color: Colors.white, fontSize: 15),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white38, fontSize: 14),
            suffixIcon: suffixIcon,
            counterText:
                "", // Hide default character count label text at bottom
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
      ],
    );
  }
}
