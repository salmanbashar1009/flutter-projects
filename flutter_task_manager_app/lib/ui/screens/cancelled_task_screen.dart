import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/data/models/network_response.dart';
import 'package:flutter_task_manager_app/data/models/task_list_model.dart';
import 'package:flutter_task_manager_app/data/services/network_caller.dart';
import 'package:flutter_task_manager_app/data/utils/urls.dart';
import 'package:flutter_task_manager_app/ui/widgets/screen_background.dart';
import 'package:flutter_task_manager_app/ui/widgets/task_list_tile.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
  bool _getCancelledTaskProgress = false;
  TaskListModel _taskListModel = TaskListModel();

  @override
  void initState() {
    getCancelledTask();
    super.initState();
  }

  Future<void> getCancelledTask() async {
    _getCancelledTaskProgress = true;
    if (mounted) {
      setState(() {});
    }
    NetworkResponse response =
        await NetworkCaller().getRequest(Urls.cancelledTasks);
    if (response.isSuccess) {
      _taskListModel = TaskListModel.fromJson(response.body!);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Failed! Try again")));
      }
    }
    _getCancelledTaskProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(child: RefreshIndicator(
        onRefresh: () async{
          getCancelledTask();
        },
        child: _getCancelledTaskProgress
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : ListView.separated(
          itemCount: _taskListModel.data!.length, // Set the item count
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
      ),),
    );
  }
}
