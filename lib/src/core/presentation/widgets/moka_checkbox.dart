import 'package:flutter/material.dart';

typedef OnChangeCheckbox = Function(bool value);

class MokaCheckbox extends StatefulWidget {
  const MokaCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChangeCheckbox,
  });

  final String label;
  final bool value;
  final OnChangeCheckbox onChangeCheckbox;

  @override
  State<MokaCheckbox> createState() => _MokaCheckboxState();
}

class _MokaCheckboxState extends State<MokaCheckbox> {
  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      dense: false,
      horizontalTitleGap: 0.0,
      contentPadding: EdgeInsets.zero,
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(widget.label),
        activeColor: Colors.white,
        checkColor: Colors.grey.shade400,
        side: MaterialStateBorderSide.resolveWith(
          (states) => BorderSide(
            width: 1.5,
            color: Colors.grey.shade400,
          ),
        ),
        value: widget.value,
        onChanged: (bool? value) {
          if (value == null) return;
          widget.onChangeCheckbox(value);
        },
      ),
    );
  }
}
