import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/data/models/count_summery_model.dart';
import 'package:flutter_task_manager_app/data/models/network_response.dart';
import 'package:flutter_task_manager_app/data/models/task_list_model.dart';
import 'package:flutter_task_manager_app/data/services/network_caller.dart';
import 'package:flutter_task_manager_app/data/utils/urls.dart';
import 'package:flutter_task_manager_app/ui/widgets/count_summery.dart';
import 'package:flutter_task_manager_app/ui/widgets/screen_background.dart';
import 'package:flutter_task_manager_app/ui/widgets/task_list_tile.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  CountSummaryModal _countSummaryModel = CountSummaryModal();
  TaskListModel _taskListModel = TaskListModel();
  bool _getCountSummeryProgress = false;
  bool _getNewTaskProgress = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCountSummery();
      getNewTask();
    });
  }

  Future<void> getCountSummery() async {
    _getCountSummeryProgress = true;
    if (mounted) {
      setState(() {});
    }

    NetworkResponse response =
        await NetworkCaller().getRequest(Urls.taskStatusCount);
    _getCountSummeryProgress = false;
    if (mounted) {
      setState(() {});
    }

    if (response.isSuccess) {
      _countSummaryModel = CountSummaryModal.fromJson(response.body!);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Failed! Try again")));
      }
    }
  }

  Future<void> getNewTask() async {
    _getNewTaskProgress = true;
    if (mounted) {
      setState(() {});
    }
    NetworkResponse response = await NetworkCaller().getRequest(Urls.newTasks);
    _getNewTaskProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      _taskListModel = TaskListModel.fromJson(response.body!);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Failed! Try again")));
      }
    }
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
            height: 50,
            width: double.infinity,
            child: _getCountSummeryProgress
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
                    itemCount: _countSummaryModel.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return CountSummery(
                          number: _countSummaryModel.data![index].sum ?? 0,
                          title:
                              _countSummaryModel.data![index].sId ?? "Error!");
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        height: 5,
                      );
                    },
                  ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.green,
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                getCountSummery();
                getNewTask();
              },
              child: _getNewTaskProgress
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      itemCount: _taskListModel.data?.length ??
                          0, // Set the item count
                      itemBuilder: (context, index) {
                        return TaskListTile(
                          onEditTap: () {},
                          onDeleteTap: () {},
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
        ],
      )),
    );
  }
}
