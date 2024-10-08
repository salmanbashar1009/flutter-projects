import 'package:flutter_task_manager_app/data/models/network_response.dart';
import 'package:flutter_task_manager_app/data/services/network_caller.dart';
import 'package:flutter_task_manager_app/data/utils/urls.dart';
import 'package:flutter_task_manager_app/ui/state_managers/get_tasks_controller.dart';
import 'package:get/get.dart';

class DeleteTaskController extends GetxController {
  final GetTasksController _getTasksController = Get.find<GetTasksController>();

  Future<bool> deleteTask(String taskID) async {
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.deleteTask(taskID));
    update();

    if (response.isSuccess) {
      _getTasksController.taskListModel.data!
          .removeWhere((element) => element.sId == taskID);
      update();
      return true;
    } else {
      return false;
    }
  }
}
