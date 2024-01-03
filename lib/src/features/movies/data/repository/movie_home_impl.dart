import 'package:movie_moka/src/features/movies/data/datasources/http_get_movie_now_playing.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie_home_entity.dart';
import 'package:movie_moka/src/features/movies/domain/repositories/movie_home.dart';

class MovieHomeRepositoryImpl implements MovieHomeRepository {
  @override
  Future<List<Movie>> getMovieNowPlaying() async {
    final res = await httpGetMovieNowPlaying();

    return res.map((e) => e.toEntity()).toList();
  }
}
