import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/movies/domain/repositories/movie_listing.dart';
import 'package:movie_moka/src/features/movies/domain/usecases/get_movie_listing.dart';

class MovieListingProvider extends ChangeNotifier {
  final MovieListingRepository repository;
  late final GetMovieListing getMovieListing;

  MovieListingProvider({required this.repository}) {
    getMovieListing = GetMovieListing(repository: repository);
  }

  Future<String> getMovies() {
    return getMovieListing.execute();
  }
}
