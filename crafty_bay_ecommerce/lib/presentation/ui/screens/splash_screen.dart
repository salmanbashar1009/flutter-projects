import 'package:crafty_bay_ecommerce/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/Auth/email_verification_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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

  Future<void> goToNextPage() async {
    await AuthController().getAccessToken();
    Future.delayed(const Duration(seconds: 2)).then((value) => Get.offAll(
        () => AuthController().isLoggedIn()
            ? const MainBottomNavBarScreen( )
            : const EmailVerificationScreen(),
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 300)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
              child: SvgPicture.asset(
            ImageAssets.canvasLogoSVG,
            width: 150,
          )),
          const Spacer(),
          const CircularProgressIndicator(),
          const SizedBox(
            height: 20,
          ),
          const Text(ImageAssets.versionCode),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
