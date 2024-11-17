import 'dart:convert';
import 'dart:developer';
import 'package:crafty_bay_ecommerce/data/model/network_response.dart';
import 'package:crafty_bay_ecommerce/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/Auth/email_verification_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class NetworkCaller {

  ///get request method
  static Future<NetworkResponse> getRequest(String url) async {
    try {
      final response = await get(Uri.parse(url),
          headers: {'data': AuthController.accessToken.toString()});
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401 || response.statusCode == 404) {
        Get.off(() => const EmailVerificationScreen());
        log('try again');
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  ///post request method
  static Future<NetworkResponse> postRequest(String url,
      Map<String, dynamic> body) async {
    try {
      final response = await post(Uri.parse(url), body: jsonEncode(body),
          headers: {'data': AuthController.accessToken.toString()});
      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401 || response.statusCode == 404) {
        //gotoLoginscreen
        Get.to(() => const EmailVerificationScreen());
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

}
















// class NetworkCaller {
//   /// get request method
//   static Future<NetworkResponse> getRequest(String url) async {
//     try {
//        Response response = await get(Uri.parse(url),
//           // headers: {
//           //   // 'token': AuthController.accessToken.toString()
//           // }
//            );
//       log(response.statusCode.toString());
//       log(response.body);
//       if (response.statusCode == 200) {
//         return NetworkResponse(
//             true, response.statusCode, jsonDecode(response.body));
//        }
//         // else if (response.statusCode == 401 || response.statusCode == 404) {
//       //   // gotoLogin();
//       // }
//         else {
//         return NetworkResponse(false, response.statusCode, null);
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//     return NetworkResponse(false, -1, null);
//   }
//
//   static Future<NetworkResponse> postRequest(String url, Map<String, dynamic> body,
//       {bool isLogin = false}) async {
//     try {
//       Response response = await post(
//         Uri.parse(url),
//         headers: {
//           'Content-Type': 'application/json',
//           // 'token': AuthController.accessToken.toString()
//         },
//         body: jsonEncode(body),
//       );
//       log(response.statusCode.toString());
//       log(response.body);
//       if (response.statusCode == 200) {
//         return NetworkResponse(
//           true,
//           response.statusCode,
//           jsonDecode(response.body),
//         );
//       } else if (response.statusCode == 401) {
//         if (isLogin == false) {
//           // gotoLogin();
//         }
//       } else {
//         return NetworkResponse(false, response.statusCode, null);
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//     return NetworkResponse(false, -1, null);
//   }
// //
// //   // static Future<void> gotoLogin() async {
// //   //   await AuthController.clear();
// //   //   Navigator.pushAndRemoveUntil(
// //   //       CraftyBay.globalKey.currentContext!,
// //   //       MaterialPageRoute(builder: (context) => const EmailVerificationScreen()),
// //   //           (route) => false);
// //   // }

