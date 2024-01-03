import 'package:movie_moka/src/features/movies/data/models/movie_model.dart';

Future<List<MovieModel>> httpGetMovieNowPlaying() async {
  final res = await Future.delayed(const Duration(seconds: 3), () {
    return [
      {
        "title": "Dilan",
        "rating": 4.5,
        "startDate": "2023-11-20",
        "imageURL":
            'https://s2.bukalapak.com/img/7057854092/large/poster_film_dilan.jpeg',
      },
      {
        "title": "Matix: Croine a I'incroyable",
        "rating": 3.5,
        "startDate": "2023-11-22",
        "imageURL":
            'https://www.originalfilmart.com/cdn/shop/products/the_matrix_1999_fr_original_film_art_a.jpg?v=1640646540',
      },
      {
        "title": "KADET 1947",
        "rating": 4.0,
        "startDate": "2023-11-21",
        "imageURL":
            'https://asset.kompas.com/crops/7Ubrj5X59RzzppNgNDS6x6gBRrM=/31x9:872x1131/300x400/data/photo/2021/10/29/617b75cc70698.jpeg',
      },
      {
        "title": "JOKER",
        "rating": 5.0,
        "startDate": "2023-11-25",
        "imageURL":
            'https://asset.kompas.com/crop/39x0:1051x1349/300x400/data/photo/2019/04/03/2579847035.jpg',
      },
      {
        "title": "Bankit",
        "rating": 4.0,
        "startDate": "2023-11-15",
        "imageURL":
            'https://assets.kompasiana.com/items/album/2016/07/30/poster-film-bangkit-cinemags-id-579c5a41d77a6127153c0385.jpg?t=o&v=300',
      },
    ];
  });

  return (res).map((e) => MovieModel.fromJson(e)).toList();
}
