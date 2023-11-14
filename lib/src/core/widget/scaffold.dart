import 'package:flutter/material.dart';
import 'package:movie_moka/src/core/widget/app_bar.dart';
import 'package:movie_moka/src/core/widget/bottom_navigation.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({
    super.key,
    required this.children,
    required this.routeName,
  });

  final Widget children;
  final String routeName;

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomAppBar(),
            Expanded(child: widget.children),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        routeName: widget.routeName,
      ),
    );
  }
}
