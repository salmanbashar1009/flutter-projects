import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/data/utils/urls.dart';
import 'package:flutter_task_manager_app/ui/state_managers/delete_task_controller.dart';
import 'package:flutter_task_manager_app/ui/state_managers/get_count_summary_controller.dart';
import 'package:flutter_task_manager_app/ui/state_managers/get_tasks_controller.dart';
import 'package:flutter_task_manager_app/ui/widgets/count_summery.dart';
import 'package:flutter_task_manager_app/ui/widgets/screen_background.dart';
import 'package:flutter_task_manager_app/ui/widgets/task_list_tile.dart';
import 'package:get/get.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final GetCountSummaryController _getCountSummaryController =
      Get.find<GetCountSummaryController>();

  final GetTasksController _getTasksController = Get.find<GetTasksController>();

  final DeleteTaskController _deleteTaskController =
      Get.find<DeleteTaskController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getCountSummaryController.getCountSummary().then((value) {
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

      _getTasksController.getTasks(Urls.newTasks).then((value) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          SizedBox(
              height: 70,
              width: double.infinity,
              child: GetBuilder<GetCountSummaryController>(
                  builder: (getCountSummaryController) {
                return getCountSummaryController.getCountSummeryProgress
                    ? const Center(
                        child: SizedBox(
                          width: 150,
                          child: LinearProgressIndicator(
                            color: Colors.green,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      )
                    : ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: getCountSummaryController
                                .countSummaryModel.data?.length ??
                            0,
                        itemBuilder: (context, index) {
                          return CountSummery(
                              number: getCountSummaryController
                                      .countSummaryModel.data![index].sum ??
                                  0,
                              title: getCountSummaryController
                                      .countSummaryModel.data![index].sId ??
                                  "Error!");
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            height: 5,
                          );
                        },
                      );
              })),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.green,
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                _getCountSummaryController.getCountSummary().then((value) {
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
                _getTasksController.getTasks(Urls.newTasks).then((value) {
                  if (value == false) {
                    Get.snackbar(
                      'Sorry!',
                      'New task data get failed!',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      borderRadius: 10,
                    );
                  }
                });
              },
              child:
                  GetBuilder<GetTasksController>(builder: (getTasksController) {
                return getTasksController.getTasksProgress
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.separated(
                        itemCount:
                            getTasksController.taskListModel.data?.length ?? 0,
                        // Set the item count
                        itemBuilder: (context, index) {
                          if (getTasksController.taskListModel.data == null ||
                              getTasksController.taskListModel.data!.isEmpty) {
                            return const Center(
                                child: Text('No data available'));
                          }
                          return TaskListTile(
                            onEditTap: () {},
                            onDeleteTap: () {
                              deleteAlertDialogue(index);
                            },
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
        ],
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
                _getCountSummaryController.getCountSummary();
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
