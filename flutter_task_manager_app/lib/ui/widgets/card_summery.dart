import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/styles/styles.dart';

class CardSummery extends StatelessWidget {

  const CardSummery({
    super.key, required this.number, required this.title,
  });

 final int number;
 final String title;


  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 120,
      child: Card(
        color: Colors.amberAccent,
        margin: EdgeInsets.symmetric(horizontal:5),
        shape: RoundedRectangleBorder(),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("7",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
            Text("New"),
          ],
        ),
      ),
    );
  }
}