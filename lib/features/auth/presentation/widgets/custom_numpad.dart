import 'package:flutter/material.dart';

/// A custom responsive in-app numeric keyboard widget.
/// Renders a numeric grid (1-9), with a bottom row for empty space, 0, and a Delete key.
class CustomNumpad extends StatelessWidget {
  final ValueChanged<String> onKeyPressed;

  const CustomNumpad({
    super.key,
    required this.onKeyPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5), // Light gray background
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildRow(['1', '2', '3']),
            const SizedBox(height: 12),
            _buildRow(['4', '5', '6']),
            const SizedBox(height: 12),
            _buildRow(['7', '8', '9']),
            const SizedBox(height: 12),
            _buildRow(['', '0', 'Delete']),
          ],
        ),
      ),
    );
  }

  /// Builds a single horizontal row of keyboard buttons
  Widget _buildRow(List<String> keys) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: keys.map((key) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: _buildKeyButton(key),
          ),
        );
      }).toList(),
    );
  }

  /// Builds a key button based on the label (Number, Delete, or Spacer)
  Widget _buildKeyButton(String label) {
    if (label.isEmpty) {
      return const SizedBox(height: 52); // Empty spacer
    }

    final isDelete = label == 'Delete';

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      elevation: 0.5,
      child: InkWell(
        onTap: () => onKeyPressed(label),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 52,
          alignment: Alignment.center,
          child: isDelete
              ? const Icon(
                  Icons.backspace_outlined,
                  color: Colors.black54,
                  size: 20,
                )
              : Text(
                  label,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'Roboto',
                  ),
                ),
        ),
      ),
    );
  }
}
