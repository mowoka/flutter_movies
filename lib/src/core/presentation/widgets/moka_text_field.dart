import 'package:flutter/material.dart';

typedef OnChangeTextForm = Function(String value);

class MokaTextField extends StatefulWidget {
  const MokaTextField({
    super.key,
    required this.label,
    required this.value,
    required this.hintText,
    required this.onChangeTextForm,
  });

  final String label;
  final String value;
  final String hintText;
  final OnChangeTextForm onChangeTextForm;

  @override
  State<MokaTextField> createState() => _MokaTextFieldState();
}

class _MokaTextFieldState extends State<MokaTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                width: 1.0,
                color: Colors.grey.shade400,
              ),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
