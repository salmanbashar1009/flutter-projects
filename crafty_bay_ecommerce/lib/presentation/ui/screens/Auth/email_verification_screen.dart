import 'package:crafty_bay_ecommerce/presentation/ui/screens/Auth/otp_verification_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/image_path_holder.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 80,),
                Center(
                    child: SvgPicture.asset(
                  ImagePathHolder.canvasLogoSVG,
                  width: 100,
                )),
                const SizedBox(height: 16,),
                Text("Welcome Back",style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 8,),
                Text("Please, enter your email address",style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey
                )),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12),
                    hintText: "Email Address",
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6))
                  ),
                ),
                const SizedBox(height: 25,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      Get.to(const OTPVerificationScreen(),transition: Transition.rightToLeft,duration: const Duration(milliseconds: 300));
                    },
                    child: const Text("Next",style: TextStyle(color: Colors.white),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
