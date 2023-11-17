import 'package:flutter/material.dart';

class BottomMenuProvier extends ChangeNotifier {
  int activeMenuIndex = 0;

  void changeBottomMenu(int value) {
    activeMenuIndex = value;
    notifyListeners();
  }
}
