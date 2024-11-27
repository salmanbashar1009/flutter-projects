import 'package:crafty_bay_ecommerce/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/home_slider_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/new_product_list_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/popular_product_list_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/special_product_list_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/Auth/complete_profile_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/Auth/email_verification_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/category_list_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/new_product_list_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/popular_product_list_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/special_product_list_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/image_assets.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/category_card.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/circular_icon_button.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/home/home_slider.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/home/section_title.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SvgPicture.asset(
              ImageAssets.logoNav,
            ),
            const Spacer(),
            CircularIconButton(
                icon: Icons.person,
                onTap: () {
                  Get.offAll(const CompleteProfileScreen(),
                      transition: Transition.rightToLeft,
                      duration: const Duration(milliseconds: 300));
                }),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(icon: Icons.phone, onTap: () {}),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(icon: Icons.notifications, onTap: () {}),
            CircularIconButton(icon: Icons.refresh, onTap: () {
              AuthController.clear();
              Get.offAll(() => const EmailVerificationScreen());
            }),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: primeColor,
                    ),
                    border:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Search",
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<HomeSliderController>(builder: (homeSlidercontroller) {
                if (homeSlidercontroller.getHomeSliderInProgress) {
                  return SizedBox(width: 120,
                    child: Center(child: LinearProgressIndicator(),),);
                }
                return HomeSlider(
                    sliders: homeSlidercontroller.homeSliderModel.data ?? []);
              }),
              const SizedBox(
                height: 16,
              ),
              SectionTitle(
                onTap: () {
                  Get.to(const CategoryListScreen(),
                      transition: Transition.rightToLeft,
                      duration: const Duration(milliseconds: 300));
                },
                title: "All Categories",
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 110,
                child: GetBuilder<CategoryListController>(
                    builder: (categoryListcontroller) {
                      if (categoryListcontroller.getCategoriesInProgress) {
                        return const SizedBox(width: 120,
                          child: Center(child: LinearProgressIndicator(),),);
                      }
                      return ListView.builder(
                          itemCount: categoryListcontroller.categoryListModel
                              .data?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CatergoryCard(
                              categoryListData: categoryListcontroller
                                  .categoryListModel.data![index],);
                          });
                    }
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SectionTitle(
                  title: "Popular",
                  onTap: () {
                    Get.to(const PorpularProductListScreen(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 300));
                  }),
              SizedBox(
                height: 170,
                child: GetBuilder<PopularProductListController>(
                    builder: (popularProductLlistController) {
                      if (popularProductLlistController
                          .getPopularProductsInProgress) {
                        return const SizedBox(width: 120,
                          child: Center(child: LinearProgressIndicator(),),);
                      }
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: popularProductLlistController
                              .productListModel.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return ProductCard(
                              productData: popularProductLlistController
                                  .productListModel.data![index],);
                          });
                    }
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SectionTitle(
                  title: "Special",
                  onTap: () {
                    Get.to(const SpecialProductListScreen(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 300));
                  }),
              SizedBox(
                height: 170,
                child: GetBuilder<SpecialProductListController>(
                    builder: (specialProductListController) {
                      if (specialProductListController
                          .getSpecialProductsInProgress) {
                        return const SizedBox(width: 120,
                          child: Center(child: LinearProgressIndicator(),),);
                      }
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: specialProductListController
                              .productListModel.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return ProductCard(
                              productData: specialProductListController
                                  .productListModel.data![index],);
                          });
                    }
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SectionTitle(
                  title: "New",
                  onTap: () {
                    Get.to(const NewProductListScreen(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 300));
                  }),
              SizedBox(
                height: 170,
                child: GetBuilder<NewProductListController>(
                    builder: (newProductListController) {
                      if (newProductListController.getNewProductsInProgress) {
                        return const SizedBox(width: 120,
                          child: Center(child: LinearProgressIndicator(),),);
                      }
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: newProductListController.productListModel
                              .data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return ProductCard(
                              productData: newProductListController
                                  .productListModel.data![index],);
                          });
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
