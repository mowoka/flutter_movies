import 'package:movie_moka/src/core/domain/entities/shared_preferences_with_expiry.dart';

class SharedPrefLocation extends SharedPrefWithExpiry<List<String>> {
  SharedPrefLocation({
    required super.sp,
    required super.spKey,
    required super.expiredInSeconds,
  });

  @override
  List<String> get() => sp.getStringList(spKey) ?? [];

  @override
  void set(List<String> value) {
    sp.setStringList(spKey, value);
    super.set(value);
  }
}
