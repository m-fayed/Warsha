import 'package:equatable/equatable.dart';

/// Enum representing the steps in the Phone OTP onboarding flow
enum PhoneOtpStep { phoneInput, otpInput }

/// State model for PhoneOtpCubit
class PhoneOtpState extends Equatable {
  final PhoneOtpStep step;
  final String phoneNumber;
  final String otpCode;
  final int timerSeconds;
  final bool isTimerActive;
  final bool isSuccess;
  final String? errorMessage;

  const PhoneOtpState({
    this.step = PhoneOtpStep.phoneInput,
    this.phoneNumber = '',
    this.otpCode = '',
    this.timerSeconds = 42,
    this.isTimerActive = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  /// Validates phone number length and format (minimum 10 digits excluding leading 0)
  bool get isPhoneValid {
    // Strip leading zeros for validation
    final cleaned = phoneNumber.replaceFirst(RegExp(r'^0+'), '');
    return cleaned.length >= 10 && RegExp(r'^\d+$').hasMatch(cleaned);
  }

  /// Validates OTP code is exactly 4 digits
  bool get isOtpValid => otpCode.length == 4;

  PhoneOtpState copyWith({
    PhoneOtpStep? step,
    String? phoneNumber,
    String? otpCode,
    int? timerSeconds,
    bool? isTimerActive,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return PhoneOtpState(
      step: step ?? this.step,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      otpCode: otpCode ?? this.otpCode,
      timerSeconds: timerSeconds ?? this.timerSeconds,
      isTimerActive: isTimerActive ?? this.isTimerActive,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage, // resets error message if null is passed
    );
  }

  @override
  List<Object?> get props => [
        step,
        phoneNumber,
        otpCode,
        timerSeconds,
        isTimerActive,
        isSuccess,
        errorMessage,
      ];
}
