import 'package:crafty_bay_ecommerce/presentation/ui/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text(
            "Categories",
            style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontWeight: FontWeight.w700),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: GridView.builder(
              itemCount: 15,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisSpacing: 16 ),
              itemBuilder: (context,index){
                return const FittedBox(child: CatergoryCard());
              }),
        ));
  }
}
