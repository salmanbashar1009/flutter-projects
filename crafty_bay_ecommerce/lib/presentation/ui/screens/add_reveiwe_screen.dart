import 'package:crafty_bay_ecommerce/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/Auth/email_verification_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/Auth/otp_verification_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key});

  @override
  State<AddReviewScreen> createState() =>
      _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.grey.withOpacity(0.3),
        surfaceTintColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        title: Text("Create Reviews",
            style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontWeight: FontWeight.w700)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 100,),
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
                  maxLines: 6,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12),
                      hintText: "Write Review",
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6))
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      Get.to(const EmailVerificationScreen(),transition: Transition.rightToLeft,duration: const Duration(milliseconds: 300));
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
