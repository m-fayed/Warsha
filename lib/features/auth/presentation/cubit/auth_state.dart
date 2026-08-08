import 'package:equatable/equatable.dart';

/// State class for AuthCubit handling user registration & login
class AuthState extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String password;
  final bool isPasswordVisible;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const AuthState({
    this.name = '',
    this.email = '',
    this.phone = '',
    this.password = '',
    this.isPasswordVisible = false,
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  /// Check basic registration form validity
  bool get isFormValid {
    final isNameValid = name.trim().isNotEmpty;
    final isEmailValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email.trim());
    final isPhoneValid = phone.trim().length >= 8;
    final isPasswordValid = password.length >= 6;

    return isNameValid && isEmailValid && isPhoneValid && isPasswordValid;
  }

  /// Check login form validity (email & password)
  bool get isLoginFormValid {
    final isEmailValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email.trim());
    final isPasswordValid = password.length >= 6;

    return isEmailValid && isPasswordValid;
  }

  AuthState copyWith({
    String? name,
    String? email,
    String? phone,
    String? password,
    bool? isPasswordVisible,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return AuthState(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        name,
        email,
        phone,
        password,
        isPasswordVisible,
        isLoading,
        isSuccess,
        errorMessage,
      ];
}
