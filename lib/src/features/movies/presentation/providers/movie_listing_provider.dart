import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/movies/domain/repositories/movie_listing.dart';
import 'package:movie_moka/src/features/movies/domain/usecases/get_movie_listing.dart';

class MovieListingProvider extends ChangeNotifier {
  final MovieListingRepository repository;
  late final GetMovieListing getMovieListing;
  String get locationSearchKeyword => _locationSearchKeyword;
  String get location => _location;

  // initialize variable
  String _locationSearchKeyword = '';
  String _location = 'Cimahi';

  MovieListingProvider({required this.repository}) {
    getMovieListing = GetMovieListing(repository: repository);
  }

  // Register function
  Future<String> getMovies() {
    return getMovieListing.execute();
  }

  void resetLocationSearchKeyword() async {
    _locationSearchKeyword = '';
    notifyListeners();
  }

  void updateLocation(String value) async {
    _location = value;
    notifyListeners();
  }
}
