import 'package:movie_moka/src/features/movies/data/datasources/http_get_movie_detail.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie_detail_entity.dart';
import 'package:movie_moka/src/features/movies/domain/repositories/movie_detail.dart';

class MovieDetailRepositoryImpl implements MovieDetailRepository {
  @override
  Future<MovieDetailEntity> getMovieDetail({required movieId}) async {
    final res = await httpGetMovieDetail(movieId: movieId);

    return res.toEntity();
  }
}
