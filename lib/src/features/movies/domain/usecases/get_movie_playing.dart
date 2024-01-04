import 'package:movie_moka/src/features/movies/domain/entities/movie.dart';
import 'package:movie_moka/src/features/movies/domain/repositories/movie_listing.dart';

class GetMoviePlaying {
  final MovieListingRepository repository;
  GetMoviePlaying({required this.repository});

  Future<List<Movie>> execute() {
    return repository.getMoviePlaying();
  }
}
