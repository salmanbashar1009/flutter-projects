import 'package:flutter/material.dart';

class CountSummery extends StatelessWidget {
  final int number;
  final String title;

  const CountSummery({
    super.key, required this.number, required this.title,
  });




  @override
  Widget build(BuildContext context) {
    return    SizedBox(
      width: 120,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal:5),
        shape: const RoundedRectangleBorder(),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$number",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
            Text(title),
          ],
        ),
      ),
    );
  }
}