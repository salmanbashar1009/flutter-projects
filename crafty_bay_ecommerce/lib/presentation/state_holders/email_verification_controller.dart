import 'package:crafty_bay_ecommerce/data/model/network_response.dart';
import 'package:crafty_bay_ecommerce/data/services/network_caller.dart';
import 'package:crafty_bay_ecommerce/data/utilities/urls.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController {
  bool _emailVerificationInProgress = false;
  String? status;
  String _message = " ";

  bool get emailVerificationInProgress => _emailVerificationInProgress;

  String get message => _message;

  Future verifyEmail(String email) async {
    _emailVerificationInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.emailVerify(email));
    _emailVerificationInProgress = false;
    update();

    if (response.isSuccess) {
      status = response.responseBody?["msg"].toString() ?? " " ;
      return true;
    } else {
      _message = "Email verification failed! Try again";
      return false;
    }
  }
}
