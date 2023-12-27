import 'package:flutter/material.dart';

class MokaDropdown<T> extends StatelessWidget {
  const MokaDropdown({
    super.key,
    required this.label,
    required this.hintText,
    required this.onChanged,
    this.isMandatory = false,
    this.readOnly,
    this.isExpanded,
    this.value,
    this.items,
    this.validator,
  });

  final String label;
  final String hintText;
  final bool isMandatory;
  final bool? readOnly;
  final bool? isExpanded;
  final Function(T value)? onChanged;
  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final String? Function(T? value)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (isMandatory)
                const Text(
                  '*',
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 40,
            child: DropdownButtonFormField<T>(
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              icon: const Icon(Icons.keyboard_arrow_down),
              hint: readOnly != null && readOnly! ? Text(hintText) : null,
              isExpanded: isExpanded ?? false,
              isDense: true,
              onChanged: onChanged != null
                  ? (value) {
                      if (value == null) return;
                      onChanged!(value);
                    }
                  : null,
              value: value,
              items: readOnly != null && readOnly! ? null : items,
              validator: (value) {
                if (readOnly == true) return null;
                if (validator == null) return null;
                return validator!(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
