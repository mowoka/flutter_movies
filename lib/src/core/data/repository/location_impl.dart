import 'package:movie_moka/src/core/data/datasources/http_get_location.dart';
import 'package:movie_moka/src/core/data/datasources/shared_pref_location.dart';
import 'package:movie_moka/src/core/domain/repositories/location_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationRepositoryImpl implements LocationRepository {
  late final SharedPrefLocation _spLocation;

  LocationRepositoryImpl({required SharedPreferences sharedPreferences}) {
    _spLocation = SharedPrefLocation(
      sp: sharedPreferences,
      spKey: 'spLocation',
      expiredInSeconds: 600,
    );
  }

  @override
  Future<List<String>> getLocations() async {
    final isExpired = _spLocation.isExpired();
    if (!isExpired) return _spLocation.get();
    try {
      final result = await httpGetLocation();
      _spLocation.set(result);
      return result;
    } catch (e) {
      return _spLocation.get();
    }
  }
}
