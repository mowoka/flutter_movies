import 'package:flutter/material.dart';

class MovieDetailSynopsis extends StatefulWidget {
  const MovieDetailSynopsis({super.key});

  @override
  State<MovieDetailSynopsis> createState() => _MovieDetailSynopsisState();
}

class _MovieDetailSynopsisState extends State<MovieDetailSynopsis> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(children: [
        Text(
          'SYNOPSIS',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade500,
          ),
        )
      ]),
    );
  }
}
