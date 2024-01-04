import 'package:flutter/foundation.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie.dart';
import 'package:movie_moka/src/features/movies/domain/repositories/movie_home.dart';
import 'package:movie_moka/src/features/movies/domain/usecases/get_movie_now_playing.dart';

class MovieHomeProvider extends ChangeNotifier {
  final MovieHomeRepository repository;

  // initialize variable
  late final GetMovieNowPlaying getMovieNowPlaying;

  MovieHomeProvider({required this.repository}) {
    getMovieNowPlaying = GetMovieNowPlaying(repository: repository);
  }

  // register function
  Future<List<Movie>> getMovieNowPlayingList() {
    return getMovieNowPlaying.execute();
  }
}
