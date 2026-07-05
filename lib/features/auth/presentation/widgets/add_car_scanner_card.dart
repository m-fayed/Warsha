import 'package:flutter/material.dart';
import 'dotted_border_painter.dart';

class AddCarScannerCard extends StatelessWidget {
  final bool isScanning;
  final VoidCallback onTap;

  const AddCarScannerCard({
    super.key,
    required this.isScanning,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isScanning ? null : onTap,
      child: SizedBox(
        width: double.infinity,
        height: 124,
        child: CustomPaint(
          painter: DottedBorderPainter(
            color: isScanning ? const Color(0xFFFF6B00) : Colors.grey.shade400,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF9F9F9), // Light grayish tint background
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: Center(
              child: isScanning
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: Color(0xFFFF6B00),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Scanning license plate...',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade800,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.qr_code_scanner_rounded,
                          color: Color(0xFFFF6B00),
                          size: 32,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Scan car license',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Auto-fills your details',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
