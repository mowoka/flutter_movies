import 'package:flutter/material.dart';

class MokaBouncing extends StatefulWidget {
  const MokaBouncing({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  State<MokaBouncing> createState() => _MokaBouncingState();
}

class _MokaBouncingState extends State<MokaBouncing>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -5 * _controller.value),
          child: widget.child,
        );
      },
    );
  }
}
