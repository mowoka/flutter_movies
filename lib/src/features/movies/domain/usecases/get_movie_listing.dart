import 'package:movie_moka/src/features/movies/domain/repositories/movie_listing.dart';

class GetMovieListing {
  final MovieListingRepository repository;
  GetMovieListing({required this.repository});

  Future<String> execute() {
    return repository.getMovieListing();
  }
}
