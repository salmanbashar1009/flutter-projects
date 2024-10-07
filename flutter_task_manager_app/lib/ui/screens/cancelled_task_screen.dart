import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/data/utils/urls.dart';
import 'package:flutter_task_manager_app/ui/state_managers/get_tasks_controller.dart';
import 'package:flutter_task_manager_app/ui/widgets/screen_background.dart';
import 'package:flutter_task_manager_app/ui/widgets/task_list_tile.dart';
import 'package:get/get.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
  // bool _getCancelledTaskProgress = false;
  // TaskListModel _taskListModel = TaskListModel();

  final GetTasksController _getTasksController = Get.find<GetTasksController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getTasksController.getTasks(Urls.cancelledTasks).then((value) {
        if (value == false) {
          Get.snackbar("Sorry!", "Error occurred!",
              backgroundColor: Colors.red,
              borderRadius: 10,
              colorText: Colors.white);
        }
      });
    });
  }

  // Future<void> getCancelledTask() async {
  //   _getCancelledTaskProgress = true;
  //   if (mounted) {
  //     setState(() {});
  //   }
  //   NetworkResponse response =
  //       await NetworkCaller().getRequest(Urls.cancelledTasks);
  //   if (response.isSuccess) {
  //     _taskListModel = TaskListModel.fromJson(response.body!);
  //   } else {
  //     if (mounted) {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(const SnackBar(content: Text("Failed! Try again")));
  //     }
  //   }
  //   _getCancelledTaskProgress = false;
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
            _getTasksController.getTasks(Urls.cancelledTasks).then((value) {
              if (value == false) {
                Get.snackbar("Sorry!", "Error occurred!",
                    backgroundColor: Colors.red,
                    borderRadius: 10,
                    colorText: Colors.white);
              }
            });
          },
          child: GetBuilder<GetTasksController>(builder: (getTasksController){
            return getTasksController.getTasksProgress
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : ListView.separated(
              itemCount: getTasksController.taskListModel.data?.length ?? 0, // Set the item count
              itemBuilder: (context, index) {
                if (getTasksController.taskListModel.data == null ||
                    getTasksController.taskListModel.data!.isEmpty) {
                  return const Center(
                      child: Text('No data available'));
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
        ),
      ),
    );
  }
}
