import 'package:flutter/material.dart';

typedef OnTap = Function();

class MokaInkWell extends StatefulWidget {
  const MokaInkWell({
    super.key,
    required this.child,
    required this.onTap,
  });

  final Widget child;
  final OnTap onTap;
  @override
  State<MokaInkWell> createState() => _MokaInkWellState();
}

class _MokaInkWellState extends State<MokaInkWell> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: widget.onTap,
      child: widget.child,
    );
  }
}
