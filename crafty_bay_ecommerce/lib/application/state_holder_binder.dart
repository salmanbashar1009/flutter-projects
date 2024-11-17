import 'package:crafty_bay_ecommerce/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/email_verification_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/home_slider_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/new_product_list_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/otp_verification_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/popular_product_list_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/special_product_list_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/wish_list_controller.dart';
import 'package:get/get.dart';

class StateHolderBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavBarController());
    Get.put(EmailVerificationController());
    Get.put(OTPVerificationController());
    Get.put(HomeSliderController());
    Get.put(CategoryListController());
    Get.put(PopularProductListController());
    Get.put(SpecialProductListController());
    Get.put(NewProductListController());
    Get.put(WishListController());
  }
}
