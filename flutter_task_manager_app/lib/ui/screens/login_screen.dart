import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/data/models/auth_utility.dart';
import 'package:flutter_task_manager_app/data/models/login_model.dart';
import 'package:flutter_task_manager_app/data/models/network_response.dart';
import 'package:flutter_task_manager_app/data/services/network_caller.dart';
import 'package:flutter_task_manager_app/data/utils/urls.dart';
import 'package:flutter_task_manager_app/styles/styles.dart';
import 'package:flutter_task_manager_app/ui/screens/auth/email_verification_screen.dart';
import 'package:flutter_task_manager_app/ui/screens/sign_up_screen.dart';
import 'package:flutter_task_manager_app/ui/screens/task_view_navbar_screen.dart';
import 'package:flutter_task_manager_app/ui/state_managers/login_controller.dart';
import 'package:flutter_task_manager_app/ui/widgets/screen_background.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEController = TextEditingController();
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
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: appInputDecoration('User email'),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter user email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _passwordTEController,
                    obscureText: true,
                    decoration: appInputDecoration('Password'),
                    validator: (String? value) {
                      if ((value?.isEmpty ?? true) || (value!.length <= 5)) {
                        return "Wrong password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GetBuilder<LoginController>(builder: (loginController) {
                    return SizedBox(
                        width: double.infinity,
                        child: Visibility(
                          visible: loginController.isLoginProgress == false,
                          replacement: const Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              loginController
                                  .userLogin(_emailTEController.text.trim(),
                                      _passwordTEController.text)
                                  .then((value) {
                                if (value) {
                                  Get.snackbar("Congrats!!", "Login success!",
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,);
                                  Get.offAll(const TaskViewNavBarScreen());
                                }else{
                                  Get.snackbar("Sorry!!", "Login failed!",
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,);
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
                    height: 75,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const EmailVerificationScreen(),
                          transition: Transition.rightToLeft,
                          duration: const Duration(milliseconds: 500));
                    },
                    child: const Center(
                        child: Text("Forget Password?",
                            style: TextStyle(color: colorLightGray))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have account?",
                          style: Theme.of(context).textTheme.titleMedium),
                      InkWell(
                        onTap: () {
                          Get.offAll(const SignUpScreen(),
                              transition: Transition.rightToLeft,
                              duration: const Duration(milliseconds: 500));
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
      ),
    );
  }
}
