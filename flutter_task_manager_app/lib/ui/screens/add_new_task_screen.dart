import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/styles/styles.dart';
import 'package:flutter_task_manager_app/ui/screens/new_task_screen.dart';
import 'package:flutter_task_manager_app/ui/screens/task_view_navbar_screen.dart';
import 'package:flutter_task_manager_app/ui/state_managers/add_new_task_controller.dart';
import 'package:flutter_task_manager_app/ui/widgets/screen_background.dart';
import 'package:get/get.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Text("Add New Task",
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _titleTEController,
                  decoration: appInputDecoration("title"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _descriptionTEController,
                  maxLines: 5,
                  maxLength: 500,
                  decoration: appInputDecoration('description'),
                ),
                const SizedBox(
                  height: 25,
                ),
                GetBuilder<AddNewTaskController>(
                    builder: (addNewTaskController) {
                  return SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible:
                            addNewTaskController.addNewTaskProgress == false,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              addNewTaskController
                                  .addNewTask(_titleTEController.text.trim(),
                                      _descriptionTEController.text.trim())
                                  .then((value) {
                                if (value) {
                                  _titleTEController.clear();
                                  _descriptionTEController.clear();
                                  Get.offAll(const TaskViewNavBarScreen());
                                  Get.snackbar(
                                    "Congrats!",
                                    "Task added successfully!",
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                    borderRadius: 10,
                                  );
                                }else{
                                  Get.snackbar(
                                    "Failed!",
                                    "Task is not added!",
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                    borderRadius: 10,
                                  );
                                }
                              });
                            },
                            child: Text(
                              'Save',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                            )),
                      ));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
