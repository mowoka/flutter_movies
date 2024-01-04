import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie_listing_entity.dart';
import 'package:movie_moka/src/features/movies/domain/repositories/movie_listing.dart';
import 'package:movie_moka/src/features/movies/domain/usecases/get_movie_playing.dart';
import 'package:movie_moka/src/features/movies/domain/usecases/get_movie_upcoming.dart';

class MovieListingProvider extends ChangeNotifier {
  final MovieListingRepository repository;
  MovieListingSection get movieSection => _movieSection;
  bool get isShowSearchMovie => _isShowSearchMovie;
  MovieListShowType get movieListShowType => _movieListShowType;

  // initialize variable
  late final GetMoviePlaying getMovieListing;
  late final GetMovieUpcoming getMovieUpcoming;
  MovieListingSection _movieSection = MovieListingSection.playing;
  bool _isShowSearchMovie = false;
  MovieListShowType _movieListShowType = MovieListShowType.grid;

  MovieListingProvider({required this.repository}) {
    getMovieListing = GetMoviePlaying(repository: repository);
    getMovieUpcoming = GetMovieUpcoming(repository: repository);
  }

  // Register function
  Future<List<Movie>> getMoviePlaying() {
    return getMovieListing.execute();
  }

  Future<List<Movie>> getMovieUpcomingList() {
    return getMovieUpcoming.execute();
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
