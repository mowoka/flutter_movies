import 'package:movie_moka/src/features/movies/data/datasources/http_get_move_upcoming.dart';
import 'package:movie_moka/src/features/movies/data/datasources/http_get_movie_playing.dart';
import 'package:movie_moka/src/features/movies/data/datasources/shared_pref_movie_playing.dart';
import 'package:movie_moka/src/features/movies/data/datasources/shared_pref_movie_upcoming.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie.dart';
import 'package:movie_moka/src/features/movies/domain/repositories/movie_listing.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieListingRepositoryImpl implements MovieListingRepository {
  late final SharedPrefMoviePlaying _spMoviePlaying;
  late final SharedPrefMovieUpcoming _spMovieUpcoming;

  MovieListingRepositoryImpl({
    required SharedPreferences sharedPreferences,
  }) {
    _spMoviePlaying = SharedPrefMoviePlaying(
      sp: sharedPreferences,
      spKey: 'spMoviePlaying',
      expiredInSeconds: 600,
    );
    _spMovieUpcoming = SharedPrefMovieUpcoming(
      sp: sharedPreferences,
      spKey: 'spMovieUpcoming',
      expiredInSeconds: 600,
    );
  }

  @override
  Future<List<Movie>> getMoviePlaying() async {
    final isExpired = _spMoviePlaying.isExpired();
    if (!isExpired && _spMoviePlaying.get() != null) {
      return _spMoviePlaying.get()!;
    }
    try {
      final result = await httpGetMoviePlaying();
      final entity = result.map((e) => e.toEntity()).toList();
      _spMoviePlaying.set(entity);
      return entity;
    } catch (e) {
      return _spMoviePlaying.get() ?? [];
    }
  }

  @override
  Future<List<Movie>> getMovieUpcoming() async {
    final isExpired = _spMovieUpcoming.isExpired();
    if (!isExpired && _spMovieUpcoming.get() != null) {
      return _spMovieUpcoming.get()!;
    }
    try {
      final result = await httpGetMovieUpcoming();
      final entity = result.map((e) => e.toEntity()).toList();
      _spMovieUpcoming.set(entity);
      return entity;
    } catch (e) {
      return _spMovieUpcoming.get() ?? [];
    }
  }
}
