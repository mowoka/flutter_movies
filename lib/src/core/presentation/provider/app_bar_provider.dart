import 'package:flutter/material.dart';
import 'package:movie_moka/src/core/presentation/widget/app_bar.dart';

class AppBarProvider extends ChangeNotifier {
  Variant variant = Variant.primary;

  void changeAppBarVariant(Variant value) {
    variant = value;
    notifyListeners();
  }
}
