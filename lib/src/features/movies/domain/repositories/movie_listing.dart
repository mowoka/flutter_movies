abstract class MovieListingRepository {
  late Future<String> Function() accessTokenGetter;

  MovieListingRepository({required this.accessTokenGetter});

  Future<String> getMovieListing();
}
