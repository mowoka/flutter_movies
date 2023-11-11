import 'package:movie_moka/src/features/movies/domain/repositories/movie_listing.dart';

class MovieListingRepositoryImpl implements MovieListingRepository {
  @override
  late Future<String> Function() accessTokenGetter;

  MovieListingRepositoryImpl({required this.accessTokenGetter});

  @override
  Future<String> getMovieListing() async {
    final result = await Future.delayed(const Duration(seconds: 3), () {
      return 'Hello World';
    });

    return result;
  }
}
