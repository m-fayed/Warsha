import 'package:flutter/material.dart';

class OtpPinSection extends StatelessWidget {
  final String otpCode;
  final bool isTimerActive;
  final int timerSeconds;
  final VoidCallback onResend;

  const OtpPinSection({
    super.key,
    required this.otpCode,
    required this.isTimerActive,
    required this.timerSeconds,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 4 OTP digit boxes
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            final hasChar = otpCode.length > index;
            final isCurrent = otpCode.length == index;
            final char = hasChar ? otpCode[index] : '';

            return AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: isCurrent ? const Color(0xFFFF6B00) : Colors.grey.shade300,
                  width: isCurrent ? 2.0 : 1.0,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                char,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: 'Roboto',
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 32),

        // Resend code countdown timer
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isTimerActive) ...[
              Text(
                "Resend code in 00:${timerSeconds.toString().padLeft(2, '0')}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                  fontFamily: 'Roboto',
                ),
              ),
            ] else ...[
              GestureDetector(
                onTap: onResend,
                child: const Text(
                  "Resend code",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF6B00), // Action orange text
                    fontFamily: 'Roboto',
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
