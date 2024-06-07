import 'package:crafty_bay_ecommerce/presentation/ui/screens/splash_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const SplashScreen(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: MaterialColor(ColorPalette.primarySwatch.value,ColorPalette.color))
        ) ,
        );
  }
}
