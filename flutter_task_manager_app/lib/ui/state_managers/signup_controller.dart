import 'package:flutter_task_manager_app/data/models/network_response.dart';
import 'package:flutter_task_manager_app/data/services/network_caller.dart';
import 'package:flutter_task_manager_app/data/utils/urls.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  bool _signUpInProgress = false;

  bool get signUpInProgress => _signUpInProgress;

  Future<bool> userSignUp(String email, String firstName, String lastName,
      String mobile, String password) async {
    _signUpInProgress = true;
    update();

    Map<String, dynamic> requestBody = {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "password": password,
      "photo": "",
    };

    final NetworkResponse response =
    await NetworkCaller().postRequest(Urls.registration, requestBody);

    _signUpInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      return false;
    }
  }
}


