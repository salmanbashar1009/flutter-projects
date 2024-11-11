import 'package:crafty_bay_ecommerce/data/model/home_slider_model.dart';
import 'package:crafty_bay_ecommerce/data/model/network_response.dart';
import 'package:crafty_bay_ecommerce/data/services/network_caller.dart';
import 'package:crafty_bay_ecommerce/data/utilities/urls.dart';
import 'package:get/get.dart';

class HomeSliderController extends GetxController{
  bool _getHomeSliderInProgress = false;
  HomeSliderModel _homeSliderModel = HomeSliderModel();
  String _message = ' ';

  bool get getHomeSliderInProgress => _getHomeSliderInProgress;
  HomeSliderModel get homeSliderModel => _homeSliderModel;
  String get message => _message;

  Future getHomeSlider() async {
    _getHomeSliderInProgress = true;
    update();
    final NetworkResponse response =
    await NetworkCaller.getRequest(Urls.homeSlider);
    _getHomeSliderInProgress = false;
    if (response.isSuccess) {
      _homeSliderModel = HomeSliderModel.fromJson(response.responseBody ?? {})  ;
      update();
      return true;
    } else {
      _message = "Otp verification failed! Try again";
      return false;
    }
  }
}