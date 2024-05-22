import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/styles/styles.dart';
import 'package:flutter_task_manager_app/ui/screens/new_task_screen.dart';
class CustomizedAppBar extends StatefulWidget {
  const CustomizedAppBar({super.key});

  @override
  State<CustomizedAppBar> createState() => _CustomizedAppBarState();
}

class _CustomizedAppBarState extends State<CustomizedAppBar> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const NewTaskScreen(),
    const NewTaskScreen(),
    const NewTaskScreen(),
    const NewTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
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
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.all(0),
        shape: CircularNotchedRectangle(),
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
            unselectedLabelStyle: TextStyle(
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
            items: [
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
        child: Icon(
          Icons.add,
          color: colorWhite,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
