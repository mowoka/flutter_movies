import 'package:movie_moka/src/core/data/datasources/http_get_location.dart';
import 'package:movie_moka/src/core/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  @override
  Future<List<String>> getLocations() async {
    final result = await httpGetLocation();

    return result;
  }
}
