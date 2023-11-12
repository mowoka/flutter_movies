import 'package:flutter/material.dart';
import 'package:movie_moka/src/core/widget/bottom_navigation.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({
    super.key,
    required this.children,
  });

  final Widget children;

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: widget.children,
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}
