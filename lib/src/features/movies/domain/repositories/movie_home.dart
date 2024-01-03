import 'package:movie_moka/src/features/movies/domain/entities/movie_home_entity.dart';

abstract class MovieHomeRepository {
  MovieHomeRepository();

  Future<List<Movie>> getMovieNowPlaying();
}
