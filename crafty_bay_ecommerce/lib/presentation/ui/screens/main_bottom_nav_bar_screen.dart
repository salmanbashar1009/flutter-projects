import 'package:crafty_bay_ecommerce/data/model/product_list_model.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/cart_list_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/catergory_product_list_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/home_slider_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/new_product_list_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/popular_product_list_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/special_product_list_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/cart_list_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/category_list_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/wish_list_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key,});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  final MainBottomNavBarController mainBottomNavBarController = Get.put(MainBottomNavBarController());

  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoryListScreen(),
    const CartListScreen(),
    const WishListScreen(),
  ];

  @override
  void initState() {
   WidgetsBinding.instance.addPostFrameCallback((_){
     Get.find<HomeSliderController>().getHomeSlider();
     Get.find<CategoryListController>().getCategories();
     Get.find<PopularProductListController>().getPopularProducts();
     Get.find<SpecialProductListController>().getSpecialProducts();
     Get.find<NewProductListController>().getNewProducts();

   });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavBarController>(builder: (controller){
      return PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, result){
          if(didPop == false){
            Get.find<MainBottomNavBarController>().backToHome();
          }
        } ,
        child: Scaffold(
          body: _screens[controller.currentSelectedIndex],
          bottomNavigationBar: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_outlined,
                      size: 30,
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.grid_view_outlined, size: 30),
                    label: "Categories"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_basket_outlined, size: 30),
                    label: "Cart"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.card_giftcard_outlined, size: 30),
                    label: "Wish"),
              ],
              currentIndex: controller.currentSelectedIndex,
              selectedItemColor: primeColor,
              unselectedItemColor: Colors.grey.withOpacity(0.7),
              onTap: controller.changeScreen,
              unselectedLabelStyle: TextStyle(
                  color: Colors.grey.withOpacity(
                    0.7,
                  ),
                  fontWeight: FontWeight.w600),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ),
      );
    });
  }
}
