import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import '../pages/approve_quote_screen.dart';

class LiveProgressCard extends StatelessWidget {
  final String carInfo;
  final int currentStep; // 0: Diagnosing, 1: InProgress, 2: QuickCheck, 3: Ready
  final VoidCallback onApproveQuote;
  final VoidCallback onChatTap;
  final VoidCallback onCallTap;

  const LiveProgressCard({
    super.key,
    this.carInfo = 'BMW 320i • 2019',
    this.currentStep = 1,
    required this.onApproveQuote,
    required this.onChatTap,
    required this.onCallTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E), // Premium dark background
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Title & Live Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'In Progress',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF7905).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFFFF7905),
                    width: 1.0,
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Dot indicator
                    Icon(
                      Icons.circle,
                      size: 6,
                      color: Color(0xFFFF7905),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Live now',
                      style: TextStyle(
                        color: Color(0xFFFF7905),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Oil Change',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'At Bmw Station . Started 10:24 Am',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 13,
              fontFamily: 'Roboto',
            ),
          ),
          const SizedBox(height: 14),

          // 2. Status Box Container
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFFF7905).withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  carInfo,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 16),
                // Horizontal Multi-step Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStepDot(0, 'Diagnosing'),
                    _buildStepLine(0),
                    _buildStepDot(1, 'In Progress'),
                    _buildStepLine(1),
                    _buildStepDot(2, 'Quick check'),
                    _buildStepLine(2),
                    _buildStepDot(3, 'Ready'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // 3. Actions Row (Approve Quote + Chat + Call)
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ApproveQuoteScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF7905), // Primary orange
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Approve Quote (1)',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Chat button
              _buildIconButton(
                icon: Icons.chat_bubble_outline_rounded,
                onTap: onChatTap,
              ),
              const SizedBox(width: 10),
              // Call button
              _buildIconButton(
                icon: Icons.phone_in_talk_outlined,
                onTap: onCallTap,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStepDot(int stepIndex, String label) {
    final bool isCompleted = stepIndex < currentStep;
    final bool isActive = stepIndex == currentStep;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted || isActive
                ? const Color(0xFFFF7905)
                : Colors.grey.shade700,
            border: isActive
                ? Border.all(color: Colors.white, width: 2)
                : null,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            color: isCompleted || isActive ? Colors.white : Colors.grey.shade500,
            fontSize: 9,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            fontFamily: 'Roboto',
          ),
        ),
      ],
    );
  }

  Widget _buildStepLine(int leftStepIndex) {
    final bool isPassed = leftStepIndex < currentStep;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 14.0), // Align line with the dots
        child: Container(
          height: 2,
          color: isPassed ? const Color(0xFFFF7905) : Colors.grey.shade700,
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.shade800,
            width: 1.2,
          ),
          color: Colors.white.withValues(alpha: 0.05),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
