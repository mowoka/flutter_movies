import 'package:flutter/material.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_ink_well.dart';
import 'package:movie_moka/src/core/utils/date_formatter.dart';

class MokaDatePicker extends StatefulWidget {
  const MokaDatePicker({
    super.key,
    required this.label,
    required this.value,
    required this.hintText,
    required this.onChange,
    this.isMandatory = false,
  });

  final DateTime value;
  final String label;
  final String hintText;
  final bool isMandatory;
  final Function(DateTime value) onChange;

  @override
  State<MokaDatePicker> createState() => _MokaDatePickerState();
}

class _MokaDatePickerState extends State<MokaDatePicker> {
  @override
  Widget build(BuildContext context) {
    final date = dateFormatter(convertDate(widget.value), 'yMMMMd');
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
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                width: 1.0,
                color: Colors.grey.shade400,
              ),
            ),
            child: MokaInkWell(
              onTap: () async {
                final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: Colors.red, // <-- SEE HERE
                            onPrimary: Colors.white, // <-- SEE HERE
                            onSurface: Colors.black, // <-- SEE HERE
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.red, // button text color
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    });
                if (selectedDate == null) return;
                // dont forget to conver to ISO
                // final date = selectedDate.toIso8601String();
                widget.onChange(selectedDate);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (date.isNotEmpty)
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      )
                    else
                      Text(
                        widget.hintText,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    const Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
