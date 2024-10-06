import 'package:flutter_task_manager_app/data/models/count_summery_model.dart';
import 'package:flutter_task_manager_app/data/models/network_response.dart';
import 'package:flutter_task_manager_app/data/services/network_caller.dart';
import 'package:flutter_task_manager_app/data/utils/urls.dart';
import 'package:get/get.dart';

class GetCountSummaryController extends GetxController{

  CountSummaryModal _countSummaryModel = CountSummaryModal();
  bool _getCountSummaryProgress = false;

  bool get getCountSummeryProgress => _getCountSummaryProgress;
  CountSummaryModal get countSummaryModel => _countSummaryModel;

  Future<bool> getCountSummary() async {
    _getCountSummaryProgress = true;
    update();

    NetworkResponse response =
    await NetworkCaller().getRequest(Urls.taskStatusCount);
    _getCountSummaryProgress = false;
    update();

    if (response.isSuccess) {
      _countSummaryModel = CountSummaryModal.fromJson(response.body!);
      return true;
    } else {
      return false;
      }
    }
  }
