import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/app.dart';

void main() async {
  // init lib
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(MyApp(
    sharedPreferences: sharedPreferences,
  ));
}
