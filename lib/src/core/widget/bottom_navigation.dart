import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({
    super.key,
    required this.routeName,
  });

  final String routeName;

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  String getActiveMenu(String routeName) {
    switch (routeName) {
      case 'movie':
        return 'Home';
      case 'tiket':
        return 'Tikets';
      case 'f&b':
        return 'F&B';
      case 'myCgv':
        return 'My CGV';
      case 'menu':
        return 'Menu';
      default:
        return 'Home';
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeMenu = getActiveMenu(widget.routeName);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      color: Colors.white,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Menu(
            icon: Icons.home,
            title: 'Home',
            activeMenu: activeMenu,
          ),
          Menu(
            icon: Icons.event_note,
            title: 'Tikets',
            activeMenu: activeMenu,
          ),
          Menu(
            icon: Icons.fastfood,
            title: 'F&B',
            activeMenu: activeMenu,
          ),
          Menu(
            icon: Icons.person,
            title: 'My CGV',
            activeMenu: activeMenu,
          ),
          Menu(
            icon: Icons.menu,
            title: 'Menu',
            activeMenu: activeMenu,
          ),
        ],
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({
    super.key,
    required this.icon,
    required this.title,
    required this.activeMenu,
  });

  final IconData icon;
  final String title;
  final String activeMenu;

  @override
  Widget build(BuildContext context) {
    final isActiveMenu = title == activeMenu;
    return SizedBox(
      height: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: Icon(
              size: 25,
              icon,
              color: isActiveMenu ? Colors.red : Colors.black,
            ),
          ),
          SizedBox(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: isActiveMenu ? Colors.red : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
