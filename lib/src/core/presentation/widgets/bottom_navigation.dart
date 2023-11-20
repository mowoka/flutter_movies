import 'package:flutter/material.dart';

typedef OnTapNavigation = Function(int index);

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    super.key,
    required this.activeMenu,
    required this.onTapNavigation,
  });

  final int activeMenu;
  final OnTapNavigation onTapNavigation;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event_note),
          label: 'Tikets',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fastfood),
          label: 'F&B',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'My CGV',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Menu',
        ),
      ],
      currentIndex: activeMenu,
      selectedItemColor: Colors.red.shade500,
      onTap: onTapNavigation,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      showSelectedLabels: true,
    );
  }
}
