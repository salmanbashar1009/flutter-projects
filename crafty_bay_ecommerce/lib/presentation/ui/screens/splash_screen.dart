import 'package:crafty_bay_ecommerce/presentation/ui/screens/home_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/image_path_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    goToNextPage();
  }

  void goToNextPage() {
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()), (
                route) => false));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
              child: SvgPicture.asset(ImagePathHolder.craftyBayLogoSVG,
                width: 100,
              )),
          const Spacer(),
          const CircularProgressIndicator(),
          const SizedBox(
            height: 20,
          ),
          const Text(ImagePathHolder.versionCode),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
