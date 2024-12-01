import 'package:crafty_bay_ecommerce/data/model/network_response.dart';
import 'package:crafty_bay_ecommerce/data/model/product_list_model.dart';
import 'package:crafty_bay_ecommerce/data/services/network_caller.dart';
import 'package:crafty_bay_ecommerce/data/utilities/urls.dart';
import 'package:get/get.dart';

class CategoryProductListController extends GetxController {
  bool _categoryProductListInProgress = false;
  ProductListModel _categoryProductListModel = ProductListModel();
  String _message = "";

  bool get categoryProductListInProgress => _categoryProductListInProgress;

  ProductListModel get categoryProductListModel => _categoryProductListModel;

  String get message => _message;

  Future<bool> getProductByCategory(int categroyId) async {
    _categoryProductListInProgress = true;
    update();
    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getProductByCategory(categroyId));
    _categoryProductListInProgress = false;
    if (response.isSuccess) {
      _categoryProductListModel =
          ProductListModel.fromJson(response.responseBody ?? {});
      update();
      return true;
    } else {
      _message = "Product list fetch has been failed";
      return false;
    }
  }

  void setProducts(ProductListModel productListModel){
    _categoryProductListModel = productListModel;
    update();
  }
}
