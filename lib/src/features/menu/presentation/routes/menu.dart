import 'package:flutter/material.dart';

class MenuRoute extends StatefulWidget {
  const MenuRoute({super.key});

  static const routeName = 'menu';
  static const routePath = '/menu';

  @override
  State<MenuRoute> createState() => _MenuRouteState();
}

class _MenuRouteState extends State<MenuRoute> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('menu'),
    );
  }
}
