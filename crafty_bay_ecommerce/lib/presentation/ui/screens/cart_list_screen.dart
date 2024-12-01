import 'package:crafty_bay_ecommerce/presentation/state_holders/cart_list_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/style.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});


  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Get.find<CartListController>().getCartList();
    });
  }


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
      body: RefreshIndicator(
        onRefresh: ()async{
          Get.find<CartListController>().getCartList();
        },
        child: GetBuilder<CartListController>(
          builder: (cartListController) {
            if(cartListController.cartListInProgress){
              return Center(child: CircularProgressIndicator(),);
            }
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding:  const EdgeInsets.only(left: 5,right: 5, top: 8, bottom: 0),
                    child: ListView.builder(
                      itemCount: cartListController.cartList.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return CartItem(cartData: CartListController().cartList.data![index],);
                      },
                    ),
                  ),
                ),
                Container(
                  height:80,
                  padding: const EdgeInsets.symmetric(horizontal: 20,),
                  decoration: BoxDecoration(
                      color: primeColor.withOpacity(0.14),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(24),
                        topLeft: Radius.circular(24),
                      )

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Total Price",style: smallTextStyle(Colors.black54),),
                          Text("\$1000",style: largeTextStyle(primeColor),),
                        ],
                      ),
                      ElevatedButton(onPressed: (){}, child: Text("Checkout",style: smallTextStyle(Colors.white),))
                    ],
                  ),
                )
              ],

            );
          }
        ),
      ),
    );
  }
}
