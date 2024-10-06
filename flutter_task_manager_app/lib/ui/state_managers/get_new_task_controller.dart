import 'package:flutter_task_manager_app/data/models/network_response.dart';
import 'package:flutter_task_manager_app/data/models/task_list_model.dart';
import 'package:flutter_task_manager_app/data/services/network_caller.dart';
import 'package:get/get.dart';

class GetNewTaskController extends GetxController {
  bool _getNewTaskProgress = false;
  TaskListModel _taskListModel = TaskListModel();

  bool get getNewTaskProgress => _getNewTaskProgress;

  TaskListModel get taskListModel => _taskListModel;

  Future<bool> getNewTask(String url) async {
    _getNewTaskProgress = true;
    update();

    NetworkResponse response = await NetworkCaller().getRequest(url);
    _getNewTaskProgress = false;
    update();

    if (response.isSuccess) {
      _taskListModel = TaskListModel.fromJson(response.body!);
      return true;
    } else {
      return false;
    }
  }
}
