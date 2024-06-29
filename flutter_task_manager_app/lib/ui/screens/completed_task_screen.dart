import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/ui/widgets/count_summery.dart';
import 'package:flutter_task_manager_app/ui/widgets/task_list_tile.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index){
                    return const CountSummery(number: 7, title: "new");
                  },
                ),
              ),
            ),
             const Padding(
               padding: EdgeInsets.symmetric(horizontal: 16),
               child: Divider(color: Colors.green,),
             ),
            Expanded(
              child: ListView.separated(
                itemCount: 20, // Set the item count
                itemBuilder: (context, index) {
                  return TaskListTile(onDeleteTap: (){}, onEditTap: (){});
                },
                separatorBuilder: (BuildContext context, int index){
                  return const Divider(height: 5,color: Colors.black12,);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


