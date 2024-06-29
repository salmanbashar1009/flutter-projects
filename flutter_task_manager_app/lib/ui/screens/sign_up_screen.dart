import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/styles/styles.dart';
import 'package:flutter_task_manager_app/ui/screens/login_screen.dart';
import 'package:flutter_task_manager_app/ui/widgets/screen_background.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
                top: 5, bottom: MediaQuery
                .of(context)
                .viewInsets
                .bottom),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Text(
                  "Join With Us",
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  decoration: AppInputDecoration('Email'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: AppInputDecoration('First Name'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: AppInputDecoration('Last Name'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: AppInputDecoration('Mobile'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: AppInputDecoration('Password'),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(const LoginScreen(),transition: Transition.rightToLeft);
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: colorWhite,
                        size: 26,
                      ),
                    )),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have an account?",
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleMedium),
                    Text(
                      " Sign in",
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: colorGreen,),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )
      ,
    );
  }
}
