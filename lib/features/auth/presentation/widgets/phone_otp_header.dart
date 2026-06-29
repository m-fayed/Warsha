import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warsha_app/features/auth/presentation/cubit/phone_otp_cubit.dart';
import 'package:warsha_app/features/auth/presentation/cubit/phone_otp_state.dart';

class PhoneOtpHeader extends StatelessWidget {
  final PhoneOtpState state;

  const PhoneOtpHeader({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            if (state.step == PhoneOtpStep.otpInput) {
              context.read<PhoneOtpCubit>().backToPhoneInput();
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
    );
  }
}
