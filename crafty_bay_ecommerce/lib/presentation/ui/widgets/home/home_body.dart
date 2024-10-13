import 'package:crafty_bay_ecommerce/presentation/ui/screens/catergory_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/category_card.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/home/home_slider.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/home/section_title.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
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
            const HomeSlider(),
            const SizedBox(
              height: 16,
            ),
            SectionTitle(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryScreen()));
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
            SectionTitle(title: "Popular", onTap: (){}),
            SizedBox(
              height: 170,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context,index){
                    return const ProductCard();
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            SectionTitle(title: "Special", onTap: (){}),
            SizedBox(
              height: 170,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context,index){
                    return const ProductCard();
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            SectionTitle(title: "New", onTap: (){}),
            SizedBox(
              height: 170,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context,index){
                    return const ProductCard();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}