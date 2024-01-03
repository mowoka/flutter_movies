import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefWithExpiry<T> {
  final SharedPreferences sp;
  final String spKey;
  final int expiredInSeconds;

  SharedPrefWithExpiry({
    required this.sp,
    required this.spKey,
    this.expiredInSeconds = 60,
  });

  T? get() {
    return null;
  }

  void set(T value) {
    sp.setString('${spKey}_updatedAt', DateTime.now().toString());
  }

  void clear() {
    sp.remove(spKey);
    sp.remove('${spKey}_updatedAt');
  }

  bool isExpired() {
    final updatedAtStr = sp.getString('${spKey}_updatedAt');
    if (updatedAtStr == null) return true;
    final updatedAt = DateTime.parse(updatedAtStr);
    return DateTime.now().difference(updatedAt).inSeconds >= expiredInSeconds;
  }
}
