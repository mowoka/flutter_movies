import 'package:flutter/material.dart';

class PanelLineBottomModal extends StatelessWidget {
  const PanelLineBottomModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        child: Container(
          width: 48,
          height: 5,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(233, 235, 237, 1),
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
      ),
    );
  }
}
