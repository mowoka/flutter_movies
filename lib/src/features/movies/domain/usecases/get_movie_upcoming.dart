import 'package:movie_moka/src/features/movies/domain/entities/movie.dart';
import 'package:movie_moka/src/features/movies/domain/repositories/movie_listing.dart';

class GetMovieUpcoming {
  final MovieListingRepository repository;

  GetMovieUpcoming({required this.repository});

  Future<List<Movie>> execute() {
    return repository.getMovieUpcoming();
  }
}
