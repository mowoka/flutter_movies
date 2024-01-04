import 'package:movie_moka/src/features/movies/domain/entities/movie.dart';

abstract class MovieListingRepository {
  MovieListingRepository();

  Future<List<Movie>> getMoviePlaying();

  Future<String> getMovieUpcoming();
}
