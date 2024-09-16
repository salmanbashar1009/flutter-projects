import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/data/models/network_response.dart';
import 'package:flutter_task_manager_app/data/models/task_list_model.dart';
import 'package:flutter_task_manager_app/data/services/network_caller.dart';
import 'package:flutter_task_manager_app/data/utils/urls.dart';
import 'package:get/get.dart';

class UpdateTaskStatusDialogueSheet extends StatefulWidget {
  const UpdateTaskStatusDialogueSheet(
      {super.key, required this.task, });

  final TaskData task;


  @override
  State<UpdateTaskStatusDialogueSheet> createState() =>
      _UpdateTaskStatusDialogueSheetState();
}

class _UpdateTaskStatusDialogueSheetState
    extends State<UpdateTaskStatusDialogueSheet> {
  List<String> taskStatusList = ["New", "Progress", "Complete", "Cancel"];
  late String _selectedTask;
  bool _updateStatusProgress = false;

  Future<void> updateTaskStatus(String taskId, String newStatus) async {
    _updateStatusProgress = true;
    if (mounted) {
      setState(() {});
    }
    NetworkResponse response =
        await NetworkCaller().getRequest(Urls.updateTask(taskId, newStatus));
    _updateStatusProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      if (mounted) {
        Navigator.pop(context);
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Update task status failed!")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("Update Status",style: Theme.of(context).textTheme.titleMedium),
              IconButton(onPressed: (){
                Get.back();
              }, icon: const Icon(Icons.cancel))
            ],
          ),
          const Padding(padding: EdgeInsets.all(16)),
          Expanded(
              child: ListView.builder(
            itemCount: taskStatusList.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  _selectedTask = taskStatusList[index];
                  setState(() {});
                },
                title: Text(taskStatusList[index]),
                trailing: _selectedTask == taskStatusList[index]
                    ? const Icon(Icons.check)
                    : null,
              );
            },
          ),),
           Padding(padding: const EdgeInsets.all(16),
          child: Visibility(
            visible: _updateStatusProgress == false,
                replacement: const Center(child: CircularProgressIndicator(),),
                child: ElevatedButton(onPressed: (){
                  updateTaskStatus(widget.task.sId!, _selectedTask);
                }, child: const Text("update"))),)
          
        ],
      ),
    );
  }
}
