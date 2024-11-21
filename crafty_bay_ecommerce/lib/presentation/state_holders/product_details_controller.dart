import 'package:crafty_bay_ecommerce/data/model/Product_details.dart';
import 'package:crafty_bay_ecommerce/data/model/network_response.dart';
import 'package:crafty_bay_ecommerce/data/model/product_details_model.dart';
import 'package:crafty_bay_ecommerce/data/services/network_caller.dart';
import 'package:crafty_bay_ecommerce/data/utilities/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _getProductDetailsInProgress = false;
  ProductDetails _productDetails = ProductDetails();
  String _message = " ";

  final List<String> _productColors = [];
  List<String> _productSizes = [];

  bool get getProductDetailsInProgress => _getProductDetailsInProgress;

  ProductDetails get productDetails => _productDetails;

  String get message => _message;

  List<String> get productColor => _productColors;
  List<String> get productSized => _productSizes;

  Future<bool> getProductDetails(int productId) async {
    _getProductDetailsInProgress = true;
    update();
    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getProductDetails(productId));
    _getProductDetailsInProgress = false;
    if (response.isSuccess) {
      _productDetails =
          ProductDetailsModel.fromJson(response.responseBody ?? {}).data!.first;
          _convertStringToColors(_productDetails.color ?? "");
          _convertStringToSizes(_productDetails.size ?? "");
      update();
      return true;
    } else {
      _message = 'Fetch product details has been failed! Try again.';
      update();
      return false;
    }
  }

  void _convertStringToColors(String color) {
    _productColors.clear();
    final List<String> splittedColor = color.split(",");
    for(String c in splittedColor){
      if(c.isNotEmpty){
        _productColors.add(c);
      }
    }
  }

  void _convertStringToSizes(String sizes){
    _productSizes = sizes.split(",");
  }
}
