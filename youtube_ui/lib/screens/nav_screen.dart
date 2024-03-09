import 'package:flutter/material.dart';
import 'package:youtube_ui/screens/home_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;

  final _screens = [
    const HomeScreen(),
    const Scaffold(
      body: Center(
        child: Text('Explore'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Add'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Subscription'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Library'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: _screens
            .asMap()
            .map((index, screen) => MapEntry(index,
                Offstage(offstage: _selectedIndex != index, child: screen)))
            .values
            .toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              label: 'Explore',
              activeIcon: Icon(Icons.explore)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline,
                size: 45,
              ),
              label: "",
              activeIcon: Icon(
                Icons.add_circle,
                size: 45,
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_outlined),
              label: 'Subsciptions',
              activeIcon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined),
              label: 'Library',
              activeIcon: Icon(Icons.video_library))
        ],
      ),
    );
  }
}
