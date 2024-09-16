import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/data/models/auth_utility.dart';
import 'package:flutter_task_manager_app/styles/styles.dart';
import 'package:flutter_task_manager_app/ui/screens/add_new_task_screen.dart';
import 'package:flutter_task_manager_app/ui/screens/auth/update_profile_screen.dart';
import 'package:flutter_task_manager_app/ui/screens/cancelled_task_screen.dart';
import 'package:flutter_task_manager_app/ui/screens/completed_task_screen.dart';
import 'package:flutter_task_manager_app/ui/screens/in_progress_task_screen.dart';
import 'package:flutter_task_manager_app/ui/screens/login_screen.dart';
import 'package:flutter_task_manager_app/ui/screens/new_task_screen.dart';
import 'package:get/get.dart';

class TaskViewNavBarScreen extends StatefulWidget {
  const TaskViewNavBarScreen({super.key});

  @override
  State<TaskViewNavBarScreen> createState() => _TaskViewNavBarScreenState();
}

class _TaskViewNavBarScreenState extends State<TaskViewNavBarScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const NewTaskScreen(),
    const InprogressTaskScreen(),
    const CompletedTaskScreen(),
    const CancelledTaskScreen(),
  ];

  Widget profileImageHolder() {
    final userPhotoUrl = AuthUtility.userInfo.data?.photo;

    if (userPhotoUrl == null || userPhotoUrl.isEmpty) {
      // If no photo URL is available, show the default "image" icon.
      return const Icon(Icons.image,color: Colors.white,);
    } else {
      // Otherwise, load the user's photo using NetworkImage.
      return CircleAvatar(
        backgroundImage: NetworkImage(userPhotoUrl),
        // You can customize the avatar size and other properties here.
        radius: 50.0,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorGreen,
        leading:   Padding(
          padding: const EdgeInsets.only(left: 12),
          child: profileImageHolder(),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${AuthUtility.userInfo.data?.firstName ?? ' '} ${AuthUtility.userInfo.data?.lastName ?? ' '}",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: colorWhite
              ),
            ),
            Text(AuthUtility.userInfo.data?.email ?? "unknown",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: colorWhite
                )),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
                onPressed: () {
                  Get.to(const UpdateProfileScreen(),
                      transition: Transition.rightToLeft,
                      duration: const Duration(milliseconds: 500));
                },
                icon: const Icon(Icons.account_circle,color: colorWhite,)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
                onPressed: () {
                  AuthUtility.clearUserInfo();
                  Get.offAll(const LoginScreen(),
                      transition: Transition.rightToLeft,
                      duration: const Duration(milliseconds: 500));
                },
                icon: const Icon(Icons.logout,color: colorWhite,)),
          ),

        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.all(0),
        shape: const CircularNotchedRectangle(),
        height: 80,
        notchMargin: 6,
        clipBehavior: Clip.antiAlias,
        color: colorGreen,
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: BottomNavigationBar(
            backgroundColor: colorGreen,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            unselectedItemColor: Colors.white,
            unselectedLabelStyle: const TextStyle(
              color: Colors.white,
            ),
            showUnselectedLabels: true,
            selectedItemColor: Colors.yellow,
            onTap: (int i) {
              _selectedIndex = i;
              if (mounted) {
                setState(() {});
              }
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.task), label: "New"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart), label: "In Progress"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.done), label: "Completed"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.cancel), label: "Cancelled"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: colorGreen,
        child: const Icon(
          Icons.add,
          color: colorWhite,
        ),
        onPressed: () {
          Get.to(const AddNewTaskScreen(), transition: Transition.rightToLeft);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
