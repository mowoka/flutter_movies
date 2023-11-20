import 'package:flutter/material.dart';

class Foods extends StatefulWidget {
  const Foods({super.key});

  static const routeName = 'foods';
  static const routePath = '/foods';

  @override
  State<Foods> createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Foods'),
    );
  }
}
