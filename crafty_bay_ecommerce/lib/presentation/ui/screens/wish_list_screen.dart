import 'package:crafty_bay_ecommerce/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/wishi_list_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: IconButton(
                onPressed: () {
                  Get.find<MainBottomNavBarController>().backToHome();
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
          ),
          title: Text("Wish List",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.w700)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GetBuilder<WishListController>(
            builder: (wishListController) {
              if(wishListController.getWishListInProgress){
                return const Center(child: CircularProgressIndicator(color: primeColor,backgroundColor: Colors.white,),);
              }
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 16,
                ),
                itemCount: wishListController.wishListModel.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return  FittedBox(child: ProductCard(productListData: wishListController.wishListModel.data![index],));
                },
              );
            }
          ),
        ));
  }
}
