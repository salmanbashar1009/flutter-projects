import 'package:crafty_bay_ecommerce/data/model/network_response.dart';
import 'package:crafty_bay_ecommerce/data/services/network_caller.dart';
import 'package:crafty_bay_ecommerce/data/utilities/urls.dart';
import 'package:get/get.dart';

class OTPVerificationController extends GetxController {
  bool _OTPVerificationInProgress = false;
  String? status;
  String _message = " ";

  bool get otpVerificationInProgress => _OTPVerificationInProgress;

  String get message => _message;

  Future verifyOTP(String email, String otp) async {
    _OTPVerificationInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.otpVerify(email, otp));
    _OTPVerificationInProgress = false;
    update();

    if (response.isSuccess) {
      status = response.responseBody?["msg"].toString() ?? " " ;
      return true;
    } else {
      _message = "Otp verification failed! Try again";
      return false;
    }
  }
}
