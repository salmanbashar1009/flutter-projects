import 'package:flutter_task_manager_app/data/models/auth_utility.dart';
import 'package:flutter_task_manager_app/data/models/login_model.dart';
import 'package:flutter_task_manager_app/data/models/network_response.dart';
import 'package:flutter_task_manager_app/data/services/network_caller.dart';
import 'package:flutter_task_manager_app/data/utils/urls.dart';
import 'package:flutter_task_manager_app/ui/screens/task_view_navbar_screen.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool _isLoginProgress = false;

  bool get isLoginProgress => _isLoginProgress;

  Future<bool> userLogin(String email, String password) async {
    _isLoginProgress = true;
    update();

    Map<String, dynamic> requestBody = {"email": email, "password": password};

    final NetworkResponse response = await NetworkCaller()
        .postRequest(Urls.login, requestBody, isLogin: true);

    _isLoginProgress = false;
    update();

    if (response.isSuccess) {
      LoginModel model = LoginModel.fromJson(response.body!);
      await AuthUtility.saveUserInfo(model);

      Get.offAll(const TaskViewNavBarScreen(),
          transition: Transition.rightToLeft);

      return true;
    } else {
      return false;
    }
  }
}
