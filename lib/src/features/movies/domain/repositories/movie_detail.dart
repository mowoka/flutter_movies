import 'package:movie_moka/src/features/movies/domain/entities/movie_detail_entity.dart';

abstract class MovieDetailRepository {
  MovieDetailRepository();

  Future<MovieDetailEntity> getMovieDetail({required int movieId});
}
