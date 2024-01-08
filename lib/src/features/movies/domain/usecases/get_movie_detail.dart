import 'package:movie_moka/src/features/movies/domain/entities/movie_detail_entity.dart';
import 'package:movie_moka/src/features/movies/domain/repositories/movie_detail.dart';

class GetMovieDetail {
  final MovieDetailRepository repository;

  GetMovieDetail({required this.repository});

  Future<MovieDetailEntity> execute({required int movieId}) {
    return repository.getMovieDetail(movieId: movieId);
  }
}
