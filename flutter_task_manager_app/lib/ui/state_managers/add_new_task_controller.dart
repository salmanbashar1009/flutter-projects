import 'package:flutter_task_manager_app/data/models/network_response.dart';
import 'package:flutter_task_manager_app/data/services/network_caller.dart';
import 'package:flutter_task_manager_app/data/utils/urls.dart';
import 'package:get/get.dart';

class AddNewTaskController extends GetxController {
  bool _addNewTaskProgress = false;

  bool get addNewTaskProgress => _addNewTaskProgress;

  Future<bool> addNewTask(
    String title,
    String description,
  ) async {
    _addNewTaskProgress = true;
    update();

    Map<String, dynamic> requestBody = {
      "title": title,
      "description": description,
      "status": "New"
    };

    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.createTask, requestBody);
    _addNewTaskProgress = false;
    update();

    if (response.isSuccess) {
      return true;
    } else {
      return false;
    }
  }
}
