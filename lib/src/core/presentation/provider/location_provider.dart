import 'package:flutter/material.dart';
import 'package:movie_moka/src/core/domain/repositories/location_repository.dart';
import 'package:movie_moka/src/core/domain/usecases/get_locations.dart';

class LocationProvider extends ChangeNotifier {
  final LocationRepository repository;
  String get locationSearchKeyword => _locationSearchKeyword;
  String get location => _location;

  // initialize variable
  late final GetLocations getLocations;
  String _locationSearchKeyword = '';
  String _location = 'Cimahi';

  LocationProvider({required this.repository}) {
    getLocations = GetLocations(repository: repository);
  }

  Future<List<String>> getLocationList() {
    return getLocations.execute();
  }

  void updateLocationSearchKeyword(String value) {
    _locationSearchKeyword = value;
    notifyListeners();
  }

  void resetLocationSearchKeyword() {
    _locationSearchKeyword = '';
    notifyListeners();
  }

  void updateLocation(String value) {
    _location = value;
    notifyListeners();
  }
}
