import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/ui/widgets/card_summery.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
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
                height: 80,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index){
                    return CardSummery(number: 7, title: "new");
                  },
                ),
              ),
            ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16),
               child: Divider(),
             ),
            Expanded(
              child: ListView.builder(
                itemCount: 20, // Set the item count
                itemBuilder: (context, index) {
                  return const ListTile(
                    title: Text("Tahmin"),
                    subtitle: Text("I am a student"),// Display the name in ListTile
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


