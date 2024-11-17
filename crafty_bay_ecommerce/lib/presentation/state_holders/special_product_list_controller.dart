import 'package:crafty_bay_ecommerce/data/model/network_response.dart';
import 'package:crafty_bay_ecommerce/data/model/product_list_model.dart';
import 'package:crafty_bay_ecommerce/data/services/network_caller.dart';
import 'package:crafty_bay_ecommerce/data/utilities/urls.dart';
import 'package:get/get.dart';

class SpecialProductListController extends GetxController{
  bool _getSpecialProductsInProgress = false;
  ProductListModel _productListModel = ProductListModel();
  String _message = " " ;

  bool get getSpecialProductsInProgress => _getSpecialProductsInProgress;
  ProductListModel get productListModel => _productListModel;
  String get message => _message;

  Future<bool> getSpecialProducts()async{
    _getSpecialProductsInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.specialProductList);
    _getSpecialProductsInProgress = false;

    if(response.isSuccess){
      _productListModel = ProductListModel.fromJson(response.responseBody ?? {});
      update();
      return true;
    }else{
      _message = "Data loading failed! Try again.";
          return false;
    }
  }
}