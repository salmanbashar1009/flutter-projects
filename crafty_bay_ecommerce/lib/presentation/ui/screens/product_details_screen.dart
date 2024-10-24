import 'package:crafty_bay_ecommerce/presentation/ui/widgets/custom_stepper.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/home/product_details_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Stack(
              children: [
                const ProductDetailsSlider(),
                AppBar(
                  backgroundColor: Colors.transparent,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new)),
                  ),
                  title: Text("Product Details",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.w700)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Happy New Year Special Deal Save 30%",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black.withOpacity(0.7),
                            fontWeight: FontWeight.w700,),),

                    Expanded(
                      child: CustomStepper(
                          lowerLimit: 1,
                          upperLimit: 10,
                          stepValue: 1,
                          value: 1,
                          onChange: (newValue) {
                            quantity = newValue;
                          }),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
