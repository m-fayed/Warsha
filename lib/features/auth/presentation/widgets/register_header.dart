import 'package:flutter/material.dart';
import 'auth_header.dart';

/// Header widget for Register Screen
class RegisterHeader extends StatelessWidget {
  final String title;
  final String? subtitle;

  const RegisterHeader({
    super.key,
    this.title = 'Create Account',
    this.subtitle = 'Sign up to get started with Warsha',
  });

  @override
  Widget build(BuildContext context) {
    return AuthHeader(
      title: title,
      subtitle: subtitle,
    );
  }
}
