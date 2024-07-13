import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/styles/styles.dart';
import 'package:flutter_task_manager_app/ui/screens/auth/otp_verification_screen.dart';
import 'package:flutter_task_manager_app/ui/screens/login_screen.dart';
import 'package:flutter_task_manager_app/ui/screens/sign_up_screen.dart';
import 'package:flutter_task_manager_app/ui/screens/task_view_navbar_screen.dart';
import 'package:flutter_task_manager_app/ui/widgets/screen_background.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
                top: 5, bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 130,
                ),
                Text(
                  "Enter Email Address",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "A 6 digit verification PIN will be sent to your email ",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: colorLightGray
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: appInputDecoration('Email'),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(const OTPVerificationScreen(),
                            transition: Transition.rightToLeft, duration: const Duration(milliseconds: 500));
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: colorWhite,
                        size: 26,
                      ),
                    )),
                const SizedBox(
                  height: 75,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have an account?",
                        style: Theme.of(context).textTheme.titleMedium),
                    InkWell(
                      onTap: () {
                        Get.offAll(const LoginScreen(), transition: Transition.rightToLeft,
                            duration: const Duration(milliseconds: 500));
                      },
                      child: Text(
                        " Sign in",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: colorGreen,
                                ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
