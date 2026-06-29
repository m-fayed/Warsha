import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'phone_otp_state.dart';

/// Cubit managing phone entry and OTP verification state machine
class PhoneOtpCubit extends Cubit<PhoneOtpState> {
  Timer? _timer;

  PhoneOtpCubit() : super(const PhoneOtpState());

  /// Process keys clicked on the custom Numpad
  void keyPressed(String key) {
    if (state.step == PhoneOtpStep.phoneInput) {
      if (key == 'Delete') {
        if (state.phoneNumber.isNotEmpty) {
          emit(state.copyWith(
            phoneNumber: state.phoneNumber.substring(0, state.phoneNumber.length - 1),
            errorMessage: null,
          ));
        }
      } else if (RegExp(r'^\d$').hasMatch(key)) {
        // Limit phone digits input to 12 digits (standard phone sizes)
        if (state.phoneNumber.length < 12) {
          emit(state.copyWith(
            phoneNumber: state.phoneNumber + key,
            errorMessage: null,
          ));
        }
      }
    } else {
      // OTP Input flow
      if (key == 'Delete') {
        if (state.otpCode.isNotEmpty) {
          emit(state.copyWith(
            otpCode: state.otpCode.substring(0, state.otpCode.length - 1),
            errorMessage: null,
          ));
        }
      } else if (RegExp(r'^\d$').hasMatch(key)) {
        // Limit code input to 4 digits
        if (state.otpCode.length < 4) {
          emit(state.copyWith(
            otpCode: state.otpCode + key,
            errorMessage: null,
          ));
        }
      }
    }
  }

  /// Transition to OTP stage and trigger countdown
  void submitPhone() {
    if (state.isPhoneValid) {
      emit(state.copyWith(
        step: PhoneOtpStep.otpInput,
        otpCode: '',
        errorMessage: null,
      ));
      startResendTimer();
    }
  }

  /// Starts or resets the 42 seconds OTP resend countdown
  void startResendTimer() {
    _timer?.cancel();
    emit(state.copyWith(
      timerSeconds: 42,
      isTimerActive: true,
    ));
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timerSeconds > 1) {
        emit(state.copyWith(timerSeconds: state.timerSeconds - 1));
      } else {
        _timer?.cancel();
        emit(state.copyWith(
          timerSeconds: 0,
          isTimerActive: false,
        ));
      }
    });
  }

  /// Resends OTP, triggering a new timer cycle
  void resendOtp() {
    if (!state.isTimerActive) {
      // Logic for resending OTP would be mocked/called here
      startResendTimer();
    }
  }

  /// Validate the entered OTP code. If correct (1234), transition to success.
  void verifyOtp() {
    if (state.isOtpValid) {
      if (state.otpCode == '1234') {
        emit(state.copyWith(isSuccess: true));
      } else {
        emit(state.copyWith(errorMessage: 'Invalid verification code'));
      }
    }
  }

  /// Go back to phone input editing
  void backToPhoneInput() {
    _timer?.cancel();
    emit(state.copyWith(
      step: PhoneOtpStep.phoneInput,
      otpCode: '',
      isTimerActive: false,
      isSuccess: false,
      errorMessage: null,
    ));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
