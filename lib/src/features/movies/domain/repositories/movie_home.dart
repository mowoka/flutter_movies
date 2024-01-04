import 'package:movie_moka/src/features/movies/domain/entities/movie.dart';

abstract class MovieHomeRepository {
  MovieHomeRepository();

  Future<List<Movie>> getMovieNowPlaying();
}
