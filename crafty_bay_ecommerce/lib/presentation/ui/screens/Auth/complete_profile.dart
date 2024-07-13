import 'package:crafty_bay_ecommerce/presentation/ui/screens/Auth/otp_verification_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/image_path_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() =>
      _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 8,),
                Center(
                    child: SvgPicture.asset(
                  ImagePathHolder.canvasLogoSVG,
                  width: 100,
                )),
                const SizedBox(height: 16,),
                Text("Complete Profile",style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 8,),
                Text("Get started with us with your details",style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey
                )),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12),
                    hintText: "First Name",
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6))
                  ),
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12),
                      hintText: "Last Name",
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6))
                  ),
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12),
                      hintText: "Mobile No",
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6))
                  ),
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12),
                      hintText: "City",
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6))
                  ),
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12),
                      hintText: "Shipping Address",
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6))
                  ),
                ),
                const SizedBox(height: 20,),
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
