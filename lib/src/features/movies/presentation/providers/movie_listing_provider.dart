import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie_listing_entity.dart';
import 'package:movie_moka/src/features/movies/domain/repositories/movie_listing.dart';
import 'package:movie_moka/src/features/movies/domain/usecases/get_movie_listing.dart';

class MovieListingProvider extends ChangeNotifier {
  final MovieListingRepository repository;
  late final GetMovieListing getMovieListing;
  String get locationSearchKeyword => _locationSearchKeyword;
  String get location => _location;
  MovieListingSection get movieSection => _movieSection;
  bool get isShowSearchMovie => _isShowSearchMovie;

  // initialize variable
  String _locationSearchKeyword = '';
  String _location = 'Cimahi';
  MovieListingSection _movieSection = MovieListingSection.playing;
  bool _isShowSearchMovie = false;

  MovieListingProvider({required this.repository}) {
    getMovieListing = GetMovieListing(repository: repository);
  }

  // Register function
  Future<String> getMovies() {
    return getMovieListing.execute();
  }

  void updateLocationSearchKeyword(String value) async {
    _locationSearchKeyword = value;
    notifyListeners();
  }

  void resetLocationSearchKeyword() async {
    _locationSearchKeyword = '';
    notifyListeners();
  }

  void updateLocation(String value) async {
    _location = value;
    notifyListeners();
  }

  void changeMovieSection(MovieListingSection value) {
    _movieSection = value;
    notifyListeners();
  }

  void changeShowSearchMovie(bool value) {
    _isShowSearchMovie = value;
    notifyListeners();
  }
}
