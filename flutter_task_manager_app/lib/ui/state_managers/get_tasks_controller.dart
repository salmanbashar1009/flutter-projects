import 'package:flutter_task_manager_app/data/models/network_response.dart';
import 'package:flutter_task_manager_app/data/models/task_list_model.dart';
import 'package:flutter_task_manager_app/data/services/network_caller.dart';
import 'package:get/get.dart';

class GetTasksController extends GetxController {
  bool _getTasksProgress = false;
  TaskListModel _taskListModel = TaskListModel();

  bool get getTasksProgress => _getTasksProgress;

  TaskListModel get taskListModel => _taskListModel;

  void getUpdateState(){
    update();
  }

  Future<bool> getTasks(String url) async {
    _getTasksProgress = true;
    update();

    NetworkResponse response = await NetworkCaller().getRequest(url);
    _getTasksProgress = false;
    update();

    if (response.isSuccess) {
      _taskListModel = TaskListModel.fromJson(response.body!);
      return true;
    } else {
      return false;
    }
  }
}
