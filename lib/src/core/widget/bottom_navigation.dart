import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      color: Colors.white,
      width: double.infinity,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Menu(
            icon: Icon(Icons.home),
            title: 'Home',
          ),
          Menu(
            icon: Icon(Icons.event_note),
            title: 'Tikets',
          ),
          Menu(
            icon: Icon(Icons.fastfood),
            title: 'F&B',
          ),
          Menu(
            icon: Icon(Icons.person),
            title: 'My CGV',
          ),
          Menu(
            icon: Icon(Icons.menu),
            title: 'Menu',
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
  });

  final Icon icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(child: icon),
          SizedBox(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
