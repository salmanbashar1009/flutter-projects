import 'package:crafty_bay_ecommerce/presentation/state_holders/email_verification_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/Auth/otp_verification_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/styles/style.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    "Welcome Back",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text("Please, enter your email address",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.grey)),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _emailTEController,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(12),
                        hintText: "Email Address",
                        hintStyle:
                            TextStyle(color: Colors.grey.withOpacity(0.6))),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return "Enter your email";
                      } else if (text!.isEmail == false) {
                        return "Enter a valid email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: GetBuilder<EmailVerificationController>(
                      builder: (controller) {
                        if (controller.emailVerificationInProgress) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              verifyEmail(controller);
                            }
                          },
                          child: const Text(
                            "Next",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
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

  Future<void> verifyEmail(EmailVerificationController controller) async {
    final response =
        await controller.verifyEmail(_emailTEController.text.trim());
    if (response) {
      if(controller.status == "success"){
        Get.to(()=> OTPVerificationScreen(email: _emailTEController.text.trim()),
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 300));
      }else{
        if (mounted) {
          showCustomSnackBar(controller.message);
        }
      }
    } else {
      if (mounted) {
        showCustomSnackBar(controller.message);
      }
    }
  }
}
