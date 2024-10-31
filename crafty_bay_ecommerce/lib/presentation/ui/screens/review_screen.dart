import 'package:crafty_bay_ecommerce/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/add_reveiwe_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/style.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  int quantity = 1;

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
        title: Text("Reviews",
            style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontWeight: FontWeight.w700)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: Card(
                      shadowColor: Colors.grey.withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey.shade200),
                          borderRadius: BorderRadius.circular(5)),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Row(
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.grey.shade200,
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 16,),
                              Text(
                                "Tahmin Bashar",
                                style: mediumTextStyle(Colors.black54),
                              ),

                            ],
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child:  Text(
                                '''কোন একটা সময়ে কারো ডেস্কটপে কভার ফটো হিসেবে আমার ছবি ছিল। যদিও তখন বিষয় টার মর্মার্থ এতোটা বুঝতেপারিনি।হয়ত বোঝার মতো বয়স হয়নি, অথবা সে সম্পর্কে তেমন একটা জ্ঞান ছিল না। কতোই বা বয়স হবে তখন, ১৫/১৬।এখনকার দিনে কিন্তু এই বয়সী একটা মেয়ে যথেষ্ট পরিপক্ব হয়ে যায়। কিন্তু আমাদের সময় টাতে অর্থাৎ আমরা যারা ৯০ দশকের ছেলেমেয়ে তাদের কাছে প্রেম ভালোবাসার বিষয় টা এতোটাও সহজ ছিল না। ''',style: smallTextStyle(Colors.black38),),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            height: 100,
            padding: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            decoration: BoxDecoration(
                color: primeColor.withOpacity(0.15),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Reviews",
                      style: mediumTextStyle(Colors.black54),
                    ),
                    const SizedBox(width: 8,),
                    Text(
                      "(1000)",
                      style: mediumTextStyle(Colors.black54),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 24,
                  child: IconButton(onPressed: (){
                    Get.to(const AddReviewScreen(), transition: Transition.rightToLeft);
                  }, icon: const Icon(Icons.add),color: Colors.white,),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
