import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/data/utils/urls.dart';
import 'package:flutter_task_manager_app/ui/state_managers/delete_task_controller.dart';
import 'package:flutter_task_manager_app/ui/state_managers/get_tasks_controller.dart';
import 'package:flutter_task_manager_app/ui/widgets/screen_background.dart';
import 'package:flutter_task_manager_app/ui/widgets/task_list_tile.dart';
import 'package:get/get.dart';

class InprogressTaskScreen extends StatefulWidget {
  const InprogressTaskScreen({super.key});

  @override
  State<InprogressTaskScreen> createState() => _InprogressTaskScreenState();
}

class _InprogressTaskScreenState extends State<InprogressTaskScreen> {
  // bool _getInProgressTaskProgress = false;
  // TaskListModel _taskListModel = TaskListModel();

  final GetTasksController _getTasksController = Get.find<GetTasksController>();
  final DeleteTaskController _deleteTaskController = Get.find<DeleteTaskController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getTasksController.getTasks(Urls.inProgressTasks).then((value) {
        if (value == false) {
          Get.snackbar(
            'Sorry!',
            'Error occurred!',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            borderRadius: 10,
          );
        }
      });
    });
  }

  // Future<void> getInProgressTAsk() async {
  //   _getInProgressTaskProgress = true;
  //   if (mounted) {
  //     setState(() {});
  //   }
  //   NetworkResponse response =
  //       await NetworkCaller().getRequest(Urls.inProgressTasks);
  //   if (response.isSuccess) {
  //     _taskListModel = TaskListModel.fromJson(response.body!);
  //   } else {
  //     if (mounted) {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(const SnackBar(content: Text("Failed! Try again")));
  //     }
  //   }
  //   _getInProgressTaskProgress = false;
  //   if (mounted) {
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
          child: RefreshIndicator(
        onRefresh: () async {
          _getTasksController.getTasks(Urls.inProgressTasks).then((value) {
            if (value == false) {
              Get.snackbar(
                'Sorry!',
                'Error occurred!',
                backgroundColor: Colors.red,
                colorText: Colors.white,
                borderRadius: 10,
              );
            }
          });
        },
        child: GetBuilder<GetTasksController>(builder: (getTasksController) {
          return getTasksController.getTasksProgress
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  itemCount: getTasksController.taskListModel.data?.length ?? 2,
                  // Set the item count
                  itemBuilder: (context, index) {
                    if (getTasksController.taskListModel.data == null || getTasksController.taskListModel.data!.isEmpty) {
                      return const Center(child: Text('No data available'));
                    }
                    return TaskListTile(
                      onDeleteTap: () {},
                      onEditTap: () {},
                      data: getTasksController.taskListModel.data![index],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      height: 5,
                      color: Colors.black12,
                    );
                  },
                );
        }),
      )),
    );
  }
  void deleteAlertDialogue(int index) {
    Get.dialog(
      AlertDialog(
        title: const Text(
          "Alert!",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        content: const Text("Do you want to delete this item?"),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("No")),
          TextButton(
            onPressed: () {
              Get.back();
              _deleteTaskController
                  .deleteTask(
                  _getTasksController.taskListModel.data![index].sId!)
                  .then((value) {
                _getTasksController.getUpdateState();
                if (value) {
                  Get.snackbar(
                    "Success",
                    "Task is deleted",
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                    borderRadius: 10,
                  );
                }else {
                  Get.snackbar("Failed!", "Error occured!",
                      backgroundColor: Colors.red,
                      borderRadius: 10,
                      colorText: Colors.white
                  );
                }
              });
            },
            child: const Text("Yes"),
          )
        ],
      ),
    );
  }
}
