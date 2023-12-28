import 'package:flutter/material.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_ink_well.dart';

enum Type { text, password }

typedef OnChangeTextForm = Function(String value);

class MokaTextField extends StatefulWidget {
  const MokaTextField({
    super.key,
    required this.label,
    required this.value,
    required this.hintText,
    required this.onChangeTextForm,
    this.type = Type.text,
    this.isMandatory = false,
    this.maxLength = 60,
    this.validator,
  });

  final String label;
  final String value;
  final String hintText;
  final OnChangeTextForm onChangeTextForm;
  final Type type;
  final bool isMandatory;
  final int maxLength;
  final String? Function(String value)? validator;

  @override
  State<MokaTextField> createState() => _MokaTextFieldState();
}

class _MokaTextFieldState extends State<MokaTextField> {
  bool isSeeTextPassword = false;

  @override
  Widget build(BuildContext context) {
    final isTextTypePassword = widget.type == Type.password;
    final validator =
        widget.validator != null ? widget.validator!(widget.value) : '';

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
                widget.label,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (widget.isMandatory)
                const Text(
                  '*',
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                width: 1.0,
                color: Colors.grey.shade400,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    obscureText: isTextTypePassword && !isSeeTextPassword,
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
                    initialValue: widget.value,
                    onChanged: (value) {
                      widget.onChangeTextForm(value);
                    },
                  ),
                ),
                if (isTextTypePassword)
                  MokaInkWell(
                    onTap: () {
                      setState(() {
                        isSeeTextPassword = !isSeeTextPassword;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        isSeeTextPassword
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                      ),
                    ),
                  )
              ],
            ),
          ),
          if (validator != null && validator.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                validator,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            )
        ],
      ),
    );
  }
}
