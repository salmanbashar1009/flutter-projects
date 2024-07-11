import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/styles/styles.dart';
import 'package:flutter_task_manager_app/ui/screens/add_new_task_screen.dart';
import 'package:flutter_task_manager_app/ui/screens/auth/update_profile_screen.dart';
import 'package:flutter_task_manager_app/ui/screens/cancelled_task_screen.dart';
import 'package:flutter_task_manager_app/ui/screens/completed_task_screen.dart';
import 'package:flutter_task_manager_app/ui/screens/in_progress_task_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 12),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://static.vecteezy.com/system/resources/previews/006/675/345/non_2x/silhouette-of-muslim-man-praying-vector.jpg'),
          ),
        ),
        backgroundColor: colorGreen,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Salman Bashar',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
            Text('salmanbashar@gmail.com',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: IconButton(
                onPressed: () {
                  Get.to(const UpdateProfileScreen());
                },
                icon: Icon(Icons.edit_note_outlined,color: Colors.white,size: 30,)),
          )
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

/*Material(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                          "https://blog.playstation.com/tachyon/2022/06/0c3c20a8d8514501524a0859461f391572ea6e61.jpg"),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text(
                          "Habibul Bashar",
                          style: TextStyle(color: colorWhite, fontSize: 16),
                        ),
                        Text("bashar@gmail.com",
                            style: TextStyle(color: colorWhite, fontSize: 12)),
                      ],
                    )
                  ],
                ),
              ),
              forceMaterialTransparency: false,
              scrolledUnderElevation: 5,
              expandedHeight: 180.0,
              collapsedHeight: 60,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                titlePadding: EdgeInsets.all(0),
                expandedTitleScale: 1.5,
                background: Image.network(
                  "https://i.pinimg.com/originals/da/06/07/da06070e6610eed218c124b384d80587.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              backgroundColor: Colors.green,
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 14),
                  child: Icon(
                    Icons.refresh,
                    color: colorWhite,
                  ),
                )
              ],
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(childCount: 20,
                    (context, index) {
              return const ListTile(
                title: Text("Tahmin"),
                subtitle:
                    Text("I am a student"), // Display the name in ListTile
              );
            })),
          ],
        ),
      )*/
