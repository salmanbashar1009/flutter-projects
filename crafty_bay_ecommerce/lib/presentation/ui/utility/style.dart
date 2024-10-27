import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

PinTheme appOTPStyle() {
  return PinTheme(
    inactiveColor: ColorPalette.primarySwatch,
    inactiveFillColor: Colors.white,
    selectedColor: Colors.green,
    activeColor: Colors.green,
    selectedFillColor: Colors.white,
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(5),
    fieldHeight: 50,
    borderWidth: 0.5,
    fieldWidth: 45,
    activeFillColor: Colors.white,
  );
}


TextStyle largeTextStyle(Color color) {
  return TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: color);
}

TextStyle mediumTextStyle(Color color) {
  return TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: color);
}

TextStyle smallTextStyle(Color color) {
  return TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: color);
}
