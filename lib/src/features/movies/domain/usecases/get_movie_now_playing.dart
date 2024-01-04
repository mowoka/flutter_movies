import 'package:movie_moka/src/features/movies/domain/entities/movie.dart';
import 'package:movie_moka/src/features/movies/domain/repositories/movie_home.dart';

class GetMovieNowPlaying {
  final MovieHomeRepository repository;

  GetMovieNowPlaying({required this.repository});

  Future<List<Movie>> execute() {
    return repository.getMovieNowPlaying();
  }
}
