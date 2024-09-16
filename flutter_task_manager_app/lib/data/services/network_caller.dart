import 'dart:convert';
import 'dart:developer';

import 'package:flutter_task_manager_app/app.dart';
import 'package:flutter_task_manager_app/data/models/auth_utility.dart';
import 'package:flutter_task_manager_app/data/models/network_response.dart';
import 'package:flutter_task_manager_app/ui/screens/sign_up_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest(url) async {
    try {
      var response = await get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
        "token": AuthUtility.userInfo.token.toString()
      });
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  Future<NetworkResponse> postRequest(url, Map<String, dynamic> body,
      {bool isLogin = false}) async {
    try {
      var response = await post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            "token": AuthUtility.userInfo.token.toString()
          },
          body: jsonEncode(body));
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        if (isLogin == false) {
          goToLogin();
        }
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  Future<void> goToLogin() async {
    await AuthUtility.clearUserInfo();
    TaskManagerApp.globalKey.currentState!.context;
    Get.offAll(const SignUpScreen(),
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 500));
  }
}
