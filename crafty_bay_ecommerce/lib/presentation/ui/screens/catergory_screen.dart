import 'package:crafty_bay_ecommerce/presentation/ui/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

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
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            child: GridView.builder(
                itemCount: 16,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisExtent: 120, ),
                itemBuilder: (context,index){
                  return const CatergoryCard();
                }),
          ),
        ));
  }
}
