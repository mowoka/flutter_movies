import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie_listing_entity.dart';
import 'package:movie_moka/src/features/movies/domain/repositories/movie_listing.dart';
import 'package:movie_moka/src/features/movies/domain/usecases/get_movie_listing.dart';

class MovieListingProvider extends ChangeNotifier {
  final MovieListingRepository repository;
  late final GetMovieListing getMovieListing;
  MovieListingSection get movieSection => _movieSection;
  bool get isShowSearchMovie => _isShowSearchMovie;
  MovieListShowType get movieListShowType => _movieListShowType;

  // initialize variable
  MovieListingSection _movieSection = MovieListingSection.playing;
  bool _isShowSearchMovie = false;
  MovieListShowType _movieListShowType = MovieListShowType.grid;

  MovieListingProvider({required this.repository}) {
    getMovieListing = GetMovieListing(repository: repository);
  }

  // Register function
  Future<String> getMovies() {
    return getMovieListing.execute();
  }

  void changeMovieSection(MovieListingSection value) {
    _movieSection = value;
    notifyListeners();
  }

  void changeShowSearchMovie(bool value) {
    _isShowSearchMovie = value;
    notifyListeners();
  }

  void changeShowMovieListType(MovieListShowType value) {
    _movieListShowType = value;
    notifyListeners();
  }
}
