import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String message, {bool isError = true, String title = "Errors"}) {
  Get.snackbar(
    title,
    message,
    messageText: Text(
      message,
      style: TextStyle(color: Colors.black54),
    ),
    colorText: Colors.black54,
    snackPosition: SnackPosition.TOP,
    backgroundColor: primeColor.withOpacity(0.1),
    duration: Duration(milliseconds:  1500),
    animationDuration: Duration(milliseconds: 300),
  );
}

