import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';

class AddCartItemButton extends StatelessWidget {
  final IconData icon;
  const AddCartItemButton({
    super.key, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 22,
      decoration: BoxDecoration(
        color: primeColor,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Icon(icon,size: 16,color: Colors.white,),
    );
  }
}