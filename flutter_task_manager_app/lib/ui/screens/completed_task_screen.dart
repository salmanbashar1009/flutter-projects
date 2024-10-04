import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/data/models/network_response.dart';
import 'package:flutter_task_manager_app/data/models/task_list_model.dart';
import 'package:flutter_task_manager_app/data/services/network_caller.dart';
import 'package:flutter_task_manager_app/data/utils/urls.dart';
import 'package:flutter_task_manager_app/ui/widgets/screen_background.dart';
import 'package:flutter_task_manager_app/ui/widgets/task_list_tile.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  bool _getCompletedTaskProgress = false;
  TaskListModel _taskListModel = TaskListModel();

  @override
  void initState() {
    getCompletedTask();
    super.initState();
  }

  Future<void> getCompletedTask() async {
    _getCompletedTaskProgress = true;
    if (mounted) {
      setState(() {});
    }
    NetworkResponse response =
        await NetworkCaller().getRequest(Urls.completedTasks);
    if (response.isSuccess) {
      _taskListModel = TaskListModel.fromJson(response.body!);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Failed! Try again")));
      }
    }
    _getCompletedTaskProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
          child: RefreshIndicator(
                  onRefresh: ()async {
                    getCompletedTask();
                  },
                  child: _getCompletedTaskProgress
                      ? const Center(
            child: CircularProgressIndicator(),
          )
                      : ListView.separated(
            itemCount:
                _taskListModel.data!.length, // Set the item count
            itemBuilder: (context, index) {
              return TaskListTile(
                onDeleteTap: () {},
                onEditTap: () {},
                data: _taskListModel.data![index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                height: 5,
                color: Colors.black12,
              );
            },
          ),
                )),
    );
  }
}
