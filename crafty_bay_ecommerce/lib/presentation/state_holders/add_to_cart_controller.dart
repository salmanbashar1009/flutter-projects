import 'package:crafty_bay_ecommerce/data/model/network_response.dart';
import 'package:crafty_bay_ecommerce/data/services/network_caller.dart';
import 'package:crafty_bay_ecommerce/data/utilities/urls.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController{
  bool _addToCartInProgrees = false;
  String _message = '';

  bool get addToCartInProgress => _addToCartInProgrees;
  String get message => _message;

  Future<bool> addToCart(int productId,String color, String size, int qty)async{
    _addToCartInProgrees = true;
    update();
    Map<String,dynamic> postBody = {
      "product_id":productId,
      "color":color,
      "size":size,
      "qty":qty
    };
    NetworkResponse response = await NetworkCaller.postRequest(Urls.addToCart, postBody);
    _addToCartInProgrees = false;
    update();
    if(response.isSuccess){
      return true;
    }else{
      _message = "Failed! Try again.";
      return false;
    }
  }
}