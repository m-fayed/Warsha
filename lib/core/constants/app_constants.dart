/// AppConstants holds application-wide constants
abstract class AppConstants {
  // App Info
  static const String appName = 'Warsha';
  static const String appVersion = '1.0.0';

  // Network
  static const String baseUrl = 'https://api.warsha.app/v1';
  static const int connectTimeout = 30000; // milliseconds
  static const int receiveTimeout = 30000; // milliseconds

  // Local Storage Keys
  static const String authTokenKey = 'auth_token';
  static const String userDataKey = 'user_data';
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'language';

  // Pagination
  static const int pageSize = 20;
  static const int initialPage = 1;

  // Date Format
  static const String dateFormat = 'yyyy-MM-dd';
  static const String dateTimeFormat = 'yyyy-MM-dd HH:mm:ss';
  static const String timeFormat = 'HH:mm';

  // Error Messages
  static const String networkError = 'فشل الاتصال بالشبكة';
  static const String unknownError = 'حدث خطأ غير متوقع';
  static const String serverError = 'خطأ من جانب الخادم';
  static const String noData = 'لا توجد بيانات';

  // Booking Status
  static const String statusPending = 'pending';
  static const String statusConfirmed = 'confirmed';
  static const String statusCompleted = 'completed';
  static const String statusCancelled = 'cancelled';
}
