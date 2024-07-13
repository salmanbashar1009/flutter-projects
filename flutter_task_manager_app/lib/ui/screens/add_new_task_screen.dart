
import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/styles/styles.dart';
import 'package:flutter_task_manager_app/ui/screens/new_task_screen.dart';
import 'package:flutter_task_manager_app/ui/screens/task_view_navbar_screen.dart';
import 'package:flutter_task_manager_app/ui/widgets/screen_background.dart';
import 'package:get/get.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Text("Add New Task", style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: appInputDecoration("title"),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  maxLines: 5,
                  maxLength: 500,
                  decoration: appInputDecoration('description'),
                ),
                const SizedBox(height: 25,),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(const TaskViewNavBarScreen(),transition: Transition.rightToLeft,
                            duration: const Duration(milliseconds: 500));
                      },
                      child: Text('Save',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),)
                    )),
              ],

            ),
        ),
      ),
    );
  }
}
