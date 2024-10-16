import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/image_assets.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/circular_icon_button.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  late  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SvgPicture.asset(
              ImageAssets.logoNav,
            ),
            const Spacer(),
            CircularIconButton(icon: Icons.person, onTap: () {}),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(icon: Icons.phone, onTap: () {}),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(icon: Icons.notifications, onTap: () {}),
          ],
        ),
      ),
      body: const HomeScreen(),
      bottomNavigationBar: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: const<BottomNavigationBarItem> [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined,size: 30,),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.grid_view_outlined,size: 30),label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_outlined,size: 30),label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.card_giftcard_outlined,size: 30),label: "Wish"),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: primeColor,
          unselectedItemColor: Colors.grey.withOpacity(0.7),
          onTap: _onItemTapped,
          unselectedLabelStyle: TextStyle(color: Colors.grey.withOpacity(0.7,),fontWeight: FontWeight.w600),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),

        ),
      ),
    );
  }
}






