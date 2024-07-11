import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/styles/styles.dart';
import 'package:flutter_task_manager_app/ui/screens/login_screen.dart';
import 'package:flutter_task_manager_app/ui/widgets/screen_background.dart';
import 'package:get/get.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
                top: 5, bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Update Profile",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6)),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                              child: Text(
                            "photo",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.upload,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: appInputDecoration('Email'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: appInputDecoration('First Name'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: appInputDecoration('Last Name'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: appInputDecoration('Mobile'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: appInputDecoration('Password'),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(const LoginScreen(),
                            transition: Transition.rightToLeft);
                      },
                      child: Text(
                        "Update",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white, fontSize: 18),
                      ),
                    )),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have an account?",
                        style: Theme.of(context).textTheme.titleMedium),
                    InkWell(
                      onTap: () {
                        Get.offAll(const LoginScreen(),
                            transition: Transition.rightToLeft);
                      },
                      child: Text(
                        " Sign in",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: colorGreen,
                                ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
