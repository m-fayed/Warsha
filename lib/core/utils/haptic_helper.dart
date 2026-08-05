import 'dart:io';
import 'package:flutter/services.dart';

/// Helper utility for triggering iOS-specific haptic feedback
class HapticHelper {
  /// Triggers light haptic feedback impact on iOS devices
  static void lightImpact() {
    if (Platform.isIOS) {
      HapticFeedback.lightImpact();
    }
  }

  /// Triggers medium haptic feedback impact on iOS devices
  static void mediumImpact() {
    if (Platform.isIOS) {
      HapticFeedback.mediumImpact();
    }
  }

  /// Triggers selection haptic feedback on iOS devices
  static void selectionClick() {
    if (Platform.isIOS) {
      HapticFeedback.selectionClick();
    }
  }
}
