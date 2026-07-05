import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warsha_app/features/auth/presentation/cubit/phone_otp_cubit.dart';
import 'package:warsha_app/features/auth/presentation/cubit/phone_otp_state.dart';
import 'package:warsha_app/features/auth/presentation/screens/add_car_and_plates_screen.dart';
import 'package:warsha_app/features/auth/presentation/widgets/custom_numpad.dart';
import '../widgets/phone_otp_header.dart';
import '../widgets/phone_input_section.dart';
import '../widgets/otp_pin_section.dart';
import '../widgets/phone_otp_cta_button.dart';

/// Entry screen for entering phone number and validating OTP code.
class PhoneOtpScreen extends StatelessWidget {
  const PhoneOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhoneOtpCubit(),
      child: BlocListener<PhoneOtpCubit, PhoneOtpState>(
        listener: (context, state) {
          if (state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('OTP Verified Successfully!'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const AddCarAndPlatesScreen()),
            );
          } else if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: const PhoneOtpView(),
      ),
    );
  }
}

/// Responsive view representing the Phone OTP onboarding screen.
class PhoneOtpView extends StatefulWidget {
  const PhoneOtpView({super.key});

  @override
  State<PhoneOtpView> createState() => _PhoneOtpViewState();
}

class _PhoneOtpViewState extends State<PhoneOtpView> {
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<PhoneOtpCubit, PhoneOtpState>(
          builder: (context, state) {
            if (_phoneController.text != state.phoneNumber) {
              _phoneController.text = state.phoneNumber;
              _phoneController.selection = TextSelection.fromPosition(
                TextPosition(offset: state.phoneNumber.length),
              );
            }

            final lastFour = state.phoneNumber.length >= 4
                ? state.phoneNumber.substring(state.phoneNumber.length - 4)
                : state.phoneNumber.padLeft(4, '9');

            final isPhoneStep = state.step == PhoneOtpStep.phoneInput;
            final isEnabled = isPhoneStep ? state.isPhoneValid : state.isOtpValid;

            return Column(
              children: [
                PhoneOtpHeader(state: state),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              isPhoneStep ? 'Step 1 of 2' : 'Step 2 of 2',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            isPhoneStep ? "What's your phone number?" : "Enter Verification Code",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            isPhoneStep
                                ? "We'll send a verification code by SMS"
                                : "Enter the code sent to ******$lastFour",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          const SizedBox(height: 36),
                          if (isPhoneStep) ...[
                            PhoneInputSection(controller: _phoneController),
                          ] else ...[
                            OtpPinSection(
                              otpCode: state.otpCode,
                              isTimerActive: state.isTimerActive,
                              timerSeconds: state.timerSeconds,
                              onResend: () => context.read<PhoneOtpCubit>().resendOtp(),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                      child: PhoneOtpCtaButton(
                        isEnabled: isEnabled,
                        label: isPhoneStep ? 'Continue' : 'Confirm',
                        onTap: () {
                          if (isPhoneStep) {
                            context.read<PhoneOtpCubit>().submitPhone();
                          } else {
                            context.read<PhoneOtpCubit>().verifyOtp();
                          }
                        },
                      ),
                    ),
                    CustomNumpad(
                      onKeyPressed: (key) {
                        context.read<PhoneOtpCubit>().keyPressed(key);
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
