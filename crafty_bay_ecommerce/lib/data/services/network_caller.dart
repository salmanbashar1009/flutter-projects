import 'dart:convert';
import 'package:crafty_bay_ecommerce/data/model/network_response.dart';
import 'package:http/http.dart';

class NetworkCaller {

  ///get request method
  static Future<NetworkResponse> getRequest(String url) async {
    try {
      final Response response = await get(Uri.parse(url));
      return _handleResponse(response);
    } catch (e) {
      throw NetworkException('Network Error: $e');
    }
  }

  ///post request method
  static Future<NetworkResponse> postRequest(String url, Map<String, dynamic> body) async {
    try {
      final response = await post(Uri.parse(url), body: jsonEncode(body));
      return _handleResponse(response);
    } catch (e) {
      throw NetworkException('Network Error: $e');
    }
  }
  static NetworkResponse _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return NetworkResponse(true, response.statusCode, jsonDecode(response.body),);
      case 401:
        throw UnauthorizedException('Unauthorized');
      case 404:
        throw NotFoundException('Not Found');
      default:
        throw NetworkException('Unexpected Error: ${response.statusCode}');
    }

  }
}

class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);

  @override
  String toString() => message;
}

class UnauthorizedException implements Exception {
  final String message;

  UnauthorizedException(this.message);

  @override
  String toString() => message;
}

class NotFoundException implements Exception {
  final String message;

  NotFoundException(this.message);

  @override
  String toString() => message;
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
// }
