import 'package:crafty_bay_ecommerce/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PorpularProductListScreen extends StatefulWidget {
  const PorpularProductListScreen({super.key});

  @override
  State<PorpularProductListScreen> createState() =>
      _PorpularProductListScreenState();
}

class _PorpularProductListScreenState extends State<PorpularProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: IconButton(
                onPressed: () {
                  Get.find<MainBottomNavBarController>().backToHome();
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
          ),
          title: Text("Popular",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.w700)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              mainAxisSpacing: 16,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return const FittedBox(child: ProductCard());
            },
          ),
        ));
  }
}
