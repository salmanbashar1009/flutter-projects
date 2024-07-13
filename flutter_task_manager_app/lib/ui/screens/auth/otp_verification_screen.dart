import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/styles/styles.dart';
import 'package:flutter_task_manager_app/ui/screens/auth/set_password_screen.dart';
import 'package:flutter_task_manager_app/ui/screens/login_screen.dart';
import 'package:flutter_task_manager_app/ui/screens/sign_up_screen.dart';
import 'package:flutter_task_manager_app/ui/screens/task_view_navbar_screen.dart';
import 'package:flutter_task_manager_app/ui/widgets/screen_background.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
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
                  "PIN Verification",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "A 6 digit verification PIN has been sent ",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: colorLightGray),
                ),
                const SizedBox(
                  height: 25,
                ),
                PinCodeTextField(
                  keyboardType: TextInputType.number,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 45,
                      activeFillColor: Colors.white,
                      selectedFillColor: colorGreen,
                      selectedColor: colorGreen,
                      inactiveColor: Colors.white,
                      inactiveFillColor: Colors.white),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  backgroundColor: Colors.transparent,
                  onCompleted: (v) {},
                  onChanged: (value) {
                    setState(() {});
                  },
                  beforeTextPaste: (text) {
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                  appContext: context,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(const SetPasswordScreen(),
                            transition: Transition.rightToLeft,
                            duration: const Duration(milliseconds: 500));
                      },
                      child: const Text(
                        "Verify",
                        style: TextStyle(
                            color: colorWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
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
                        Get.offAll(const LoginScreen(),
                            transition: Transition.rightToLeft);
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
