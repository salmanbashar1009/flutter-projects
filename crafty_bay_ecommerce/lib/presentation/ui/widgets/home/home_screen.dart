import 'package:crafty_bay_ecommerce/presentation/ui/screens/category_list_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/new_product_list_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/popular_product_list_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/special_product_list_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/category_card.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/home/home_slider.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/home/section_title.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
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
            const HomeSlider(),
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
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const CatergoryCard();
                  }),
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
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return const ProductCard();
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            SectionTitle(title: "Special", onTap: () {
              Get.to(const SpecialroductListScreen(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 300));
            }),
            SizedBox(
              height: 170,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return const ProductCard();
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            SectionTitle(title: "New", onTap: () {
              Get.to(const NewProductListScreen(),transition: Transition.rightToLeft,duration: const Duration(milliseconds: 300));
            }),
            SizedBox(
              height: 170,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return const ProductCard();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
