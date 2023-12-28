import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage customTransitionPage({
  required LocalKey pageKey,
  required Widget child,
}) {
  return CustomTransitionPage(
    transitionDuration: const Duration(
      milliseconds: 300,
    ), // Adjust duration as needed
    key: pageKey,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); // Slide in from the right
      const end = Offset.zero;
      var tween = Tween(begin: begin, end: end)
          .chain(CurveTween(curve: Curves.easeInOut));

      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    child: child,
  );
}
