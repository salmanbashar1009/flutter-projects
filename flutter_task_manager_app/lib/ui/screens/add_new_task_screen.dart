import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/data/models/network_response.dart';
import 'package:flutter_task_manager_app/data/services/network_caller.dart';
import 'package:flutter_task_manager_app/data/utils/urls.dart';
import 'package:flutter_task_manager_app/styles/styles.dart';
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

  bool _addNewTaskProgress = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> addNewTask() async {
    _addNewTaskProgress = true;
    if (mounted) {
      setState(() {});
      Map<String, dynamic> requestBody = {
        "title": _titleTEController.text.trim(),
        "description": _descriptionTEController.text.trim(),
        "status": "New"
      };

      final NetworkResponse response =
          await NetworkCaller().postRequest(Urls.createTask, requestBody);
      _addNewTaskProgress = false;
      if (mounted) {
        setState(() {});
      }

      if (response.isSuccess) {
        _titleTEController.clear();
        _descriptionTEController.clear();

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Task added successfully")));
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Failed! Try again")));
        }
      }
    }
  }

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
                SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: _addNewTaskProgress == false,
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: ElevatedButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            addNewTask();
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
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
