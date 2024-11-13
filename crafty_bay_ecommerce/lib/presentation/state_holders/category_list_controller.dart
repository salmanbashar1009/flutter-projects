import 'package:crafty_bay_ecommerce/data/model/category_list_model.dart';
import 'package:crafty_bay_ecommerce/data/model/network_response.dart';
import 'package:crafty_bay_ecommerce/data/services/network_caller.dart';
import 'package:crafty_bay_ecommerce/data/utilities/urls.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController{
  bool _getCategoriesInProgress = false;
  CategoryListModel _categoryListModel = CategoryListModel();
  String _message = "";

  bool get getCategoriesInProgress => _getCategoriesInProgress;

  CategoryListModel get categoryListModel => _categoryListModel;

  String get message => _message ;

  Future<bool> getCategories()async{
    _getCategoriesInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(Urls.categoryList);
    _getCategoriesInProgress = false;
    if(response.isSuccess){
      _categoryListModel = CategoryListModel.fromJson(response.responseBody ?? {});
      update();
      return true;
    }else{
      _message = "Data loading failed! Try again.";
      return false;
    }
  }

}