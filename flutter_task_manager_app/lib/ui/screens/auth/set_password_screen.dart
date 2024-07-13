import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/styles/styles.dart';
import 'package:flutter_task_manager_app/ui/screens/login_screen.dart';
import 'package:flutter_task_manager_app/ui/screens/sign_up_screen.dart';
import 'package:flutter_task_manager_app/ui/widgets/screen_background.dart';
import 'package:get/get.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
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
                  "Set Password",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "Minimum password length 8 character with letter & number",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: colorLightGray
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: appInputDecoration('New password'),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: appInputDecoration('Confirm password'),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAll(const LoginScreen(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 500));
                  },
                  child: const Text(
                    "Confirm",
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
                        Get.offAll(const LoginScreen(), transition: Transition.rightToLeft);
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
