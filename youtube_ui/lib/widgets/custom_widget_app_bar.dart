import 'package:flutter/material.dart';

class CustomWidgetAppBar extends StatelessWidget {
  const CustomWidgetAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: false,
      backgroundColor: Colors.white,
      leadingWidth: 120,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Image.asset(
          'assets/images/img.png',
          fit: BoxFit.contain,
        ),
      ),
      actions: [
        IconButton(
          iconSize: 25,
          color: Colors.black,
          icon: const Icon(
            Icons.cast,
          ),
          onPressed: () {},
        ),
        IconButton(
          iconSize: 25,
          color: Colors.black,
          icon: const Icon(
            Icons.notifications_none_outlined,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.black,
            size: 25,
          ),
          onPressed: () {},
        ),
        IconButton(
          iconSize: 35,
          icon:  CircleAvatar(
            foregroundImage: AssetImage('assets/images/Tahmin-Bashar.png'),
            backgroundColor: Colors.black54,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
