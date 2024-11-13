import 'package:crafty_bay_ecommerce/data/model/network_response.dart';
import 'package:crafty_bay_ecommerce/data/model/product_list_model.dart';
import 'package:crafty_bay_ecommerce/data/services/network_caller.dart';
import 'package:crafty_bay_ecommerce/data/utilities/urls.dart';
import 'package:get/get.dart';

class WishListController extends GetxController{
  bool _getWishListInProgress = false;
  WishListModel _wishListModel = WishListModel();
  String _message = " " ;

  bool get getWishListInProgress => _getWishListInProgress;
  WishListModel get wishListModel => _wishListModel;
  String get message => _message;

  Future<bool> getWishListProducts()async{
    _getWishListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.popularProductList);
    _getWishListInProgress = false;
    if(response.isSuccess){
      _wishListModel = WishListModel.fromJson(response.responseBody ?? {});
      update();
      return true;
    }else{
      _message = "Data loading failed! Try again.";
          return false;
    }
  }
}