import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';

class CatergoryCard extends StatelessWidget {
  const CatergoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: primeColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8)),
          child: const Icon(
            Icons.monitor,
            size: 40,
            color: Colors.cyan,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          "Electronics",
          style: TextStyle(
              color: Colors.cyan,
              fontSize: 15,
              fontWeight: FontWeight.w600,),
        ),
      ],
    );
  }
}