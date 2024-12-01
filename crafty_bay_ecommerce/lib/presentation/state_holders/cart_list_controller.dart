import 'package:crafty_bay_ecommerce/data/model/cart_list_model.dart';
import 'package:crafty_bay_ecommerce/data/model/network_response.dart';
import 'package:crafty_bay_ecommerce/data/services/network_caller.dart';
import 'package:crafty_bay_ecommerce/data/utilities/urls.dart';
import 'package:get/get.dart';

class CartListController extends GetxController{
  bool _cartListInProgress = false;
  CartListModel _cartList = CartListModel();
  String _message = ' ';

  bool get cartListInProgress => _cartListInProgress;
  CartListModel get cartList => _cartList;
  String get message => _message;
  
  Future<bool> getCartList()async{
    _cartListInProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.getCartList);
    _cartListInProgress = false;
    if(response.isSuccess){
      _cartList = CartListModel.fromJson(response.responseBody ?? {});
      update();
      return true;
    }else{
      _message = 'Cart list data fetch failed! try again';
      return false;
    }
  }

}