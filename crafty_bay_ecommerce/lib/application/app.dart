import 'package:crafty_bay_ecommerce/presentation/ui/screens/splash_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: MaterialColor(
                ColorPalette.primarySwatch.value, ColorPalette.primaryColor)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: primeColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)
              ),
              textStyle:  const TextStyle(
                fontSize: 18,
                letterSpacing: 0.8,
                fontWeight: FontWeight.w600,
              )
            )),
        inputDecorationTheme:   const InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.black54),
            contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 0),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: primeColor),
            borderRadius: BorderRadius.all(Radius.circular(6))),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: primeColor)),
            disabledBorder:
                 OutlineInputBorder(borderSide: BorderSide(color: primeColor))),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontWeight: FontWeight.w600
          )
        )
      ),
    );
  }
}
