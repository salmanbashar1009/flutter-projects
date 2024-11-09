import 'dart:async';

import 'package:crafty_bay_ecommerce/presentation/state_holders/otp_verification_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/styles/style.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/image_assets.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String email;

  const OTPVerificationScreen({super.key, required this.email});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  late Timer _timer;
  int _start = 120;

  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Center(
                      child: SvgPicture.asset(
                    ImageAssets.canvasLogoSVG,
                    width: 100,
                  )),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Enter OTP Code",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text("A 6 digit OTP has been sent",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.grey)),
                  const SizedBox(
                    height: 20,
                  ),
                  _start == 0
                      ? Text(
                          "OTP expired! Click on Resend ",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      : PinCodeTextField(
                          controller: _otpTEController,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          keyboardType: TextInputType.number,
                          length: 6,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          pinTheme: appOTPStyle(),
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          onCompleted: (v) {},
                          beforeTextPaste: (text) {
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                          appContext: context,
                        ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: GetBuilder<OTPVerificationController>(
                        builder: (controller) {
                      if (controller.otpVerificationInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            verifyOTP(controller);
                          }
                        },
                        child: Text(
                          "Next",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Colors.white, fontSize: 18),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                        style: const TextStyle(color: Colors.grey),
                        children: [
                          const TextSpan(
                              text: 'This code validity will expire in'),
                          TextSpan(
                              text: " $_start s",
                              style: const TextStyle(color: primeColor)),
                        ]),
                  ),
                TextButton(
                  onPressed: () {
                  },
                  child: const Text(
                    "Resend",
                    style: TextStyle(color: Colors.grey),
                  ),
                )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> verifyOTP(OTPVerificationController controller) async {
    final response =
        await controller.verifyOTP(widget.email, _otpTEController.text.trim());
    if (response) {
      Get.offAll(const MainBottomNavBarScreen(),
          transition: Transition.rightToLeft,
          duration: const Duration(milliseconds: 300));
    } else {
      if (mounted) {
        showCustomSnackBar(controller.message);
      }
    }
  }
}
