import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_ink_well.dart';

typedef OnChangeDate = Function(DateTime value);

class MokaDatePickerHorizontal extends StatefulWidget {
  const MokaDatePickerHorizontal({
    super.key,
    required this.currentDate,
    required this.onChangeDate,
    this.daysCount = 30,
  });

  final DateTime currentDate;
  final OnChangeDate onChangeDate;
  final int daysCount;

  @override
  State<MokaDatePickerHorizontal> createState() =>
      _MokaDatePickerHorizontalState();
}

class _MokaDatePickerHorizontalState extends State<MokaDatePickerHorizontal> {
  final dateNow = DateTime.now();
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: ListView.builder(
        itemCount: widget.daysCount,
        scrollDirection: Axis.horizontal,
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          DateTime date;
          DateTime date0 = dateNow.add(Duration(days: index));
          date = DateTime(date0.year, date0.month, date0.day);

          final days = DateFormat("E").format(date).toUpperCase();

          bool isSelected = _compareDate(
            date,
            widget.currentDate,
          );

          return MokaInkWell(
            onTap: () {
              widget.onChangeDate(date);
            },
            child: Container(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: index == 0 ? 20 : 15,
                right: 15,
              ),
              height: 50,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      index == 0 ? 'TODAY' : days,
                      style: TextStyle(
                        fontSize: 10,
                        color:
                            isSelected ? Colors.red.shade300 : Colors.black45,
                      ),
                    ),
                    const SizedBox(height: 6),
                    renderDateNumber(date.day.toString(), isSelected)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container renderDateNumber(String index, bool isSelected) {
    final dateNumber = index.length > 1 ? index : '0$index';

    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: isSelected ? Colors.red.shade300 : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          dateNumber,
          style: TextStyle(
            fontSize: 14,
            color: isSelected ? Colors.white : Colors.black54,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  bool _compareDate(DateTime date1, DateTime date2) {
    return date1.day == date2.day &&
        date1.month == date2.month &&
        date1.year == date2.year;
  }
}
