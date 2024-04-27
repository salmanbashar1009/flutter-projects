import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/styles/styles.dart';
import 'package:flutter_task_manager_app/ui/screens/sign_up_screen.dart';
import 'package:flutter_task_manager_app/ui/widgets/screen_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  "Get Started With",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  decoration: AppInputDecoration('Username'),
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
                      onPressed: () {},
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: colorWhite,
                        size: 26,
                      ),
                    )),
                const SizedBox(
                  height: 75,
                ),
                const Center(
                    child: Text("Forget Password?",
                        style: TextStyle(color: colorLightGray))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account?",
                        style: Theme.of(context).textTheme.titleMedium),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()),
                            (route) => false);
                      },
                      child: Text(
                        " Sign up",
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
