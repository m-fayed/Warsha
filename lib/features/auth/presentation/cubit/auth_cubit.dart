import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

/// Cubit managing authentication state including registration & login placeholder logic
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  void nameChanged(String name) {
    emit(state.copyWith(name: name, errorMessage: null));
  }

  void emailChanged(String email) {
    emit(state.copyWith(email: email, errorMessage: null));
  }

  void phoneChanged(String phone) {
    emit(state.copyWith(phone: phone, errorMessage: null));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(password: password, errorMessage: null));
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  /// Placeholder method for user registration
  Future<void> register() async {
    if (!state.isFormValid) {
      emit(state.copyWith(errorMessage: 'Please fill in all fields correctly.'));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));

    // Simulate async registration API call
    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(isLoading: false, isSuccess: true));
  }

  /// Placeholder method for user login
  Future<void> login() async {
    if (!state.isLoginFormValid) {
      emit(state.copyWith(errorMessage: 'Please enter a valid email and password.'));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));

    // Simulate async login API call
    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(isLoading: false, isSuccess: true));
  }

  void resetState() {
    emit(const AuthState());
  }
}
