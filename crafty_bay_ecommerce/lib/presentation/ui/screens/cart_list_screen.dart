import 'package:crafty_bay_ecommerce/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/add_cart_item_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
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
                Get.find<MainBottomNavBarController>().backToHome();
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        title: Text("Cart",
            style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontWeight: FontWeight.w700)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                child: ListTile(
                  title: Row(
                    children: [
                      Text(
                        "New year special shoe",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.65),
                            fontWeight: FontWeight.w700,
                        fontSize: 16),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete_forever,
                            size: 30,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Color: Red" "," " Size: X",
                        style: TextStyle(
                            color: Colors.black.withOpacity(
                              0.5,
                            ),
                            fontWeight: FontWeight.w400,
                        fontSize: 13),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Row(
                          children: [
                            const Text("\$100",style: TextStyle(
                                color: Colors.cyan,
                                fontWeight: FontWeight.w700,
                            fontSize: 16),),
                            const Spacer(),
                            const AddCartItemButton(
                              icon: Icons.remove,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text("03",style: TextStyle(
                                color: Colors.black.withOpacity(0.65),
                                fontWeight: FontWeight.w700,
                            fontSize: 16),),
                            const SizedBox(
                              width: 8,
                            ),
                            const AddCartItemButton(
                              icon: Icons.add,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
