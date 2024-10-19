import 'package:get/get.dart';

class MainBottomNavBarController extends GetxController{
  late int currentSelectedIndex = 0;

  void changeScreen(int index){
    currentSelectedIndex = index;
    update();
  }

  void backToHome(){
    changeScreen(0);
  }
}

