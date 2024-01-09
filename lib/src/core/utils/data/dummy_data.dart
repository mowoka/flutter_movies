import 'package:movie_moka/src/features/movies/domain/entities/movie.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie_detail_entity.dart';

final List<Movie> dummyMovies = [
  Movie()
    ..title = 'Dilan'
    ..rating = 4.5
    ..startDate = '2023-11-20'
    ..imageUrl =
        'https://www.originalfilmart.com/cdn/shop/products/the_matrix_1999_fr_original_film_art_a.jpg?v=1640646540'
    ..ages = '15+'
    ..types = ['Drama', 'Comedy']
    ..duration = '120 min'
    ..totalFavorite = 120,
  Movie()
    ..title = 'Dilan'
    ..rating = 4.5
    ..startDate = '2023-11-20'
    ..imageUrl =
        'https://www.originalfilmart.com/cdn/shop/products/the_matrix_1999_fr_original_film_art_a.jpg?v=1640646540'
    ..ages = '15+'
    ..types = ['Drama', 'Comedy']
    ..duration = '120 min'
    ..totalFavorite = 120,
];

final dummyMovieDetail = MovieDetailEntity()
  ..id = 1
  ..title = 'Dilan'
  ..rating = 4.5
  ..startDate = '2023-11-20'
  ..imageURL =
      'https://s2.bukalapak.com/img/7057854092/large/poster_film_dilan.jpeg'
  ..totalReviewer = '104'
  ..synopsis = '<p>Synopsis</p>'
  ..ages = '13+'
  ..duration = '114 min'
  ..types = ['Drama', 'Romance']
  ..totalFavorite = 140
  ..totalWatchlist = 260;
