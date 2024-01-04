import 'package:movie_moka/src/features/movies/domain/repositories/movie_listing.dart';

class GetMovieUpcoming {
  final MovieListingRepository repository;

  GetMovieUpcoming({required this.repository});

  Future<String> execute() {
    return repository.getMovieUpcoming();
  }
}
