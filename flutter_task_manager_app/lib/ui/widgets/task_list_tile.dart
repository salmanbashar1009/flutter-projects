import 'package:flutter/material.dart';

class TaskListTile extends StatelessWidget {
  final VoidCallback onDeleteTap, onEditTap;

  const TaskListTile({
    super.key,
    required this.onDeleteTap,
    required this.onEditTap,
  });

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'new':
        return Colors.blue;
      case 'in progress':
        return Colors.orange;
      case 'completed':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("Tahmin"),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              "task description task descriptiontask descriptiontask descriptiontask description"),
          const Text("15 July 2024"),
          const SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Chip(
                label: const Text(
                  "Status",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500,color: Colors.white),
                ),
                backgroundColor: getStatusColor("New"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(style: BorderStyle.none)),
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
