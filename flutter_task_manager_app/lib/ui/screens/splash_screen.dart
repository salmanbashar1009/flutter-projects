import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task_manager_app/ui/screens/login_screen.dart';
import 'package:flutter_task_manager_app/ui/utils/assets_utils.dart';
import 'package:flutter_task_manager_app/ui/widgets/screen_background.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    navigateToLoginScreen();
  }


  void navigateToLoginScreen() {
    Future.delayed(const Duration(seconds: 3)).then((value) async => {
    Get.offAll(const LoginScreen(),
    transition: Transition.rightToLeft,
    duration: const Duration(milliseconds: 500))
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(
          child: SvgPicture.asset(
            AssetsUtils.logoSVG,
            width: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
