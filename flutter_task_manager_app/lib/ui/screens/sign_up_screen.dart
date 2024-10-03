import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/data/models/network_response.dart';
import 'package:flutter_task_manager_app/data/services/network_caller.dart';
import 'package:flutter_task_manager_app/data/utils/urls.dart';
import 'package:flutter_task_manager_app/styles/styles.dart';
import 'package:flutter_task_manager_app/ui/screens/login_screen.dart';
import 'package:flutter_task_manager_app/ui/state_managers/signup_controller.dart';
import 'package:flutter_task_manager_app/ui/widgets/screen_background.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Join With Us",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailTEController,
                    decoration: appInputDecoration('Email'),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter your email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _firstNameTEController,
                    decoration: appInputDecoration('First Name'),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter your first name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _lastNameTEController,
                    decoration: appInputDecoration('Last Name'),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter your last name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _mobileTEController,
                    decoration: appInputDecoration('Mobile'),
                    validator: (String? value) {
                      if ((value?.isEmpty ?? true) || (value!.length != 11)) {
                        return "Enter your mobile no.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordTEController,
                    decoration: appInputDecoration('Password'),
                    validator: (String? value) {
                      if ((value?.isEmpty ?? true) || (value!.length <= 5)) {
                        return "Create password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GetBuilder<SignupController>(builder: (signupController) {
                    return SizedBox(
                        width: double.infinity,
                        child: Visibility(
                          visible: signupController.signUpInProgress == false,
                          replacement: const Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              signupController
                                  .userSignUp(
                                      _emailTEController.text.trim(),
                                      _firstNameTEController.text.trim(),
                                      _lastNameTEController.text.trim(),
                                      _mobileTEController.text.trim(),
                                      _passwordTEController.text)
                                  .then((value) {
                                if (value) {
                                  _emailTEController.clear();
                                  _firstNameTEController.clear();
                                  _lastNameTEController.clear();
                                  _mobileTEController.clear();
                                  _passwordTEController.clear();
                                  Get.snackbar(
                                    'Success',
                                    'Registration success!',
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                  );
                                  Get.offAll(const LoginScreen());
                                } else {
                                  Get.snackbar(
                                    'Sorry!',
                                    'Registration failed!',
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                  );
                                }
                              });
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: colorWhite,
                              size: 26,
                            ),
                          ),
                        ));
                  }),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Have an account?",
                          style: Theme.of(context).textTheme.titleMedium),
                      InkWell(
                        onTap: () {
                          Get.offAll(const LoginScreen(),
                              transition: Transition.rightToLeft,
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
      ),
    );
  }
}
