import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefCommon<T> {
  final SharedPreferences sp;
  SharedPrefCommon({required this.sp});
  T? get(String spKey);
  void set(String spKey, T value);
  void clear(spKey);
}
