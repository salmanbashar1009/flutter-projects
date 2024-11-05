import 'dart:convert';
import 'dart:developer';
import 'package:crafty_bay_ecommerce/data/model/network_response.dart';
import 'package:http/http.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest(String url,
      {Map<String, String>? headers}) async {
    try {
      Response response = await get(Uri.parse(url));
      log(response.statusCode.toString());
      log(response.body);
      _handleResponse(response);
    } catch (e) {
      throw NetworkException('Network Error: $e');
    }
    return NetworkResponse(false, -1, null);
  }

  Future<NetworkResponse> postRequest(String url, Map<String, dynamic> body,
      {Map<String, String>? headers}) async {
    try {
      Response response =
          await post(Uri.parse(url), body: jsonEncode(body), headers: headers);
      log(response.statusCode.toString());
      log(response.body);

      _handleResponse(response);
    } catch (e) {
      throw NetworkException('Network Error: $e');
    }
    return NetworkResponse(false, -1, null);
  }

  dynamic _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      throw UnauthorizedException('Unauthorized');
    } else if (response.statusCode == 404) {
      throw NotFoundException('Not Found');
    } else {
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
//       Response response = await get(Uri.parse(url),
//           headers: {
//             // 'token': AuthController.accessToken.toString()
//           });
//       log(response.statusCode.toString());
//       log(response.body);
//       if (response.statusCode == 200) {
//         return NetworkResponse(
//             true, response.statusCode, jsonDecode(response.body));
//       } else if (response.statusCode == 401) {
//         // gotoLogin();
//       } else {
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
//
//   // static Future<void> gotoLogin() async {
//   //   await AuthController.clear();
//   //   Navigator.pushAndRemoveUntil(
//   //       CraftyBay.globalKey.currentContext!,
//   //       MaterialPageRoute(builder: (context) => const EmailVerificationScreen()),
//   //           (route) => false);
//   // }
// }
