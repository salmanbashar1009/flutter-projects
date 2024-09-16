import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/data/models/network_response.dart';
import 'package:flutter_task_manager_app/data/models/task_list_model.dart';
import 'package:flutter_task_manager_app/data/services/network_caller.dart';
import 'package:flutter_task_manager_app/data/utils/urls.dart';
import 'package:flutter_task_manager_app/ui/widgets/task_list_tile.dart';

class InprogressTaskScreen extends StatefulWidget {
  const InprogressTaskScreen({super.key});

  @override
  State<InprogressTaskScreen> createState() => _InprogressTaskScreenState();
}

class _InprogressTaskScreenState extends State<InprogressTaskScreen> {
  bool _getInProgressTaskProgress = false;
  TaskListModel _taskListModel = TaskListModel();

  @override
  void initState() {
    getInProgressTAsk();
    super.initState();
  }

  Future<void> getInProgressTAsk() async {
    _getInProgressTaskProgress = true;
    if (mounted) {
      setState(() {});
    }
    NetworkResponse response =
        await NetworkCaller().getRequest(Urls.inProgressTasks);
    if (response.isSuccess) {
      _taskListModel = TaskListModel.fromJson(response.body!);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Failed! Try again")));
      }
    }
    _getInProgressTaskProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            getInProgressTAsk();
          },
          child: _getInProgressTaskProgress
              ? const Center(child: CircularProgressIndicator())
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
        ),
      ),
    );
  }
}
