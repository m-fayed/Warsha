import 'package:flutter/material.dart';

/// AppExtensions provides useful extensions for common operations
extension ThemeBrightness on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  bool get isLightMode => Theme.of(this).brightness == Brightness.light;
}

/// String Extensions
extension StringExtensions on String {
  /// Check if string is null or empty
  bool get isEmpty => this.isEmpty;

  /// Check if string is not null and not empty
  bool get isNotEmpty => this.isNotEmpty;

  /// Capitalize first letter
  String get capitalize =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1).toLowerCase()}';

  /// Remove all spaces
  String get removeSpaces => replaceAll(' ', '');

  /// Trim and check if empty
  bool get isTrimmedEmpty => trim().isEmpty;
}

/// List Extensions
extension ListExtensions<T> on List<T> {
  /// Safe index access
  T? getAtOrNull(int index) {
    try {
      return this[index];
    } catch (e) {
      return null;
    }
  }

  /// Check if list is empty or null
  bool get isEmptyOrNull => isEmpty;

  /// Check if list has elements
  bool get hasElements => isNotEmpty;
}

/// Duration Extensions
extension DurationExtensions on Duration {
  /// Format duration to HH:mm:ss
  String toFormattedString() {
    final hours = inHours;
    final minutes = inMinutes.remainder(60);
    final seconds = inSeconds.remainder(60);

    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

/// DateTime Extensions
extension DateTimeExtensions on DateTime {
  /// Check if date is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Check if date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// Format date as "dd/MM/yyyy"
  String toFormattedDate() {
    return '$day/${month.toString().padLeft(2, '0')}/$year';
  }

  /// Format time as "HH:mm"
  String toFormattedTime() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }
}

/// Number Extensions
extension NumExtensions on num {
  /// Format number with commas
  String toFormattedString() {
    return toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match.group(1)},',
    );
  }
}
