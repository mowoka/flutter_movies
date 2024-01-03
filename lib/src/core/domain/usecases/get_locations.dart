import 'package:movie_moka/src/core/domain/repositories/location_repository.dart';

class GetLocations {
  final LocationRepository repository;

  GetLocations({required this.repository});

  Future<List<String>> execute() {
    return repository.getLocations();
  }
}
