import 'package:crafty_bay_ecommerce/data/model/network_response.dart';
import 'package:crafty_bay_ecommerce/data/model/product_list_model.dart';
import 'package:crafty_bay_ecommerce/data/services/network_caller.dart';
import 'package:crafty_bay_ecommerce/data/utilities/urls.dart';
import 'package:get/get.dart';

class PopularProductListController extends GetxController{
  bool _getPopularProductsInProgress = false;
  ProductListModel _productListModel = ProductListModel();
  String _message = " " ;

  bool get getPopularProductsInProgress => _getPopularProductsInProgress;
  ProductListModel get productListModel => _productListModel;
  String get message => _message;

  Future<bool> getPopularProducts()async{
    _getPopularProductsInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.popularProductList);
    _getPopularProductsInProgress = false;

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