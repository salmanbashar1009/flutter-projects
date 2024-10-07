import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/data/models/task_list_model.dart';

class TaskListTile extends StatelessWidget {
  final VoidCallback onDeleteTap, onEditTap;
  final TaskData data;

  const TaskListTile({
    super.key,
    required this.onDeleteTap,
    required this.onEditTap, required this.data,
  });

  Color getStatusColor(String status) {
    switch (status) {
      case 'New':
        return Colors.blue;
      case 'progress':
        return Colors.orange;
      case 'Completed':
        return Colors.green;
      case 'Cancel':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:  Text(data.title ?? "Unknown"),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
              data.description ?? " "),
           Text(data.createdDate ?? " "),
          const SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){
                },
                child: Chip(
                  label:  Text(
                    data.status ?? " ",
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500,color: Colors.white),
                  ),
                  backgroundColor: getStatusColor(data.status ?? " "),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(style: BorderStyle.none)),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: onEditTap,
                icon: const Icon(Icons.edit_note_outlined, color: Colors.green,),
              ),
              IconButton(
                  onPressed: onDeleteTap,
                  icon: const Icon(Icons.delete_forever_outlined, color: Colors.red,)),
            ],
          )
        ],
      ), // Display the name in ListTile
    );
  }
}
