import 'package:crafty_bay_ecommerce/data/model/category_list_data.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';

class CatergoryCard extends StatelessWidget {
  const CatergoryCard({
    super.key, required this.categoryListData,
  });

  final CategoryListData categoryListData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 75,
          width: 75,
          padding: const EdgeInsets.all(18),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              color: primeColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8)),
          child:  Image.network(categoryListData.categoryImg ?? " ", fit: BoxFit.cover,),
        ),
        const SizedBox(
          height: 5,
        ),
         Text(
          categoryListData.categoryName ?? " ",
          style: TextStyle(
              color: Colors.cyan,
              fontSize: 15,
              fontWeight: FontWeight.w600,),
        ),
      ],
    );
  }
}