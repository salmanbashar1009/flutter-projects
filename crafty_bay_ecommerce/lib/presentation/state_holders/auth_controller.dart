import 'dart:convert';

import 'package:crafty_bay_ecommerce/data/model/verification_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController{
 VerficationModel _accessToken = VerficationModel();

 VerficationModel get accessToken => _accessToken;

  Future<void> setAccessToken(VerficationModel token)async{
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   await sharedPreferences.setString("access_token", jsonEncode(token.toJson()));
   _accessToken = token;
 }

  Future<void> getAccessToken()async{
   final SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
   String? token = sharedPreferences.getString("access_token");
 }

  Future<void> clear()async{
   final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   await sharedPreferences.clear();
 }

  bool isLoggedIn(){
   return _accessToken != null;
 }

}