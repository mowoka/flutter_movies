import 'package:flutter/material.dart';
import 'package:movie_moka/src/core/presentation/widgets/date_picker_horizontal.dart';

class MovieDetailShow extends StatefulWidget {
  const MovieDetailShow({super.key});

  @override
  State<MovieDetailShow> createState() => _MovieDetailShowState();
}

class _MovieDetailShowState extends State<MovieDetailShow> {
  DateTime _currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'SHOW',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade500,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: MokaDatePickerHorizontal(
              currentDate: _currentDate,
              onChangeDate: (value) {
                setState(() {
                  _currentDate = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
