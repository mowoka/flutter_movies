import 'package:movie_moka/src/features/movies/data/models/movie_model.dart';

Future<List<MovieModel>> httpGetMoviePlaying() async {
  final res = await Future.delayed(const Duration(seconds: 3), () {
    return [
      {
        "title": "Dilan",
        "rating": 4.5,
        "startDate": "2023-11-20",
        "imageURL":
            'https://s2.bukalapak.com/img/7057854092/large/poster_film_dilan.jpeg',
        "ages": '15+',
        "types": ['Drama', 'Comedy'],
        "duration": '120 min',
      },
      {
        "title": "Matix: Croine a I'incroyable",
        "rating": 3.5,
        "startDate": "2023-11-22",
        "imageURL":
            'https://www.originalfilmart.com/cdn/shop/products/the_matrix_1999_fr_original_film_art_a.jpg?v=1640646540',
        "ages": '19+',
        "types": ['Actions'],
        "duration": '110 min',
      },
      {
        "title": "KADET 1947",
        "rating": 4.0,
        "startDate": "2023-11-21",
        "imageURL":
            'https://asset.kompas.com/crops/7Ubrj5X59RzzppNgNDS6x6gBRrM=/31x9:872x1131/300x400/data/photo/2021/10/29/617b75cc70698.jpeg',
        "ages": '17+',
        "types": ['Actions', 'Comedy'],
        "duration": '140 min',
      },
      {
        "title": "JOKER",
        "rating": 5.0,
        "startDate": "2023-11-25",
        "imageURL":
            'https://asset.kompas.com/crop/39x0:1051x1349/300x400/data/photo/2019/04/03/2579847035.jpg',
        "ages": '21+',
        "types": ['Actions', 'Horror'],
        "duration": '121 min',
      },
      {
        "title": "Bankit",
        "rating": 4.0,
        "startDate": "2023-11-15",
        "imageURL":
            'https://assets.kompasiana.com/items/album/2016/07/30/poster-film-bangkit-cinemags-id-579c5a41d77a6127153c0385.jpg?t=o&v=300',
        "ages": '16+',
        "types": ['Drama'],
        "duration": '98 min',
      },
      {
        "title": "AKAL",
        "rating": 3.5,
        "startDate": '2023-12-15',
        "imageURL":
            'https://d10j0070m15qtm.cloudfront.net/uploads/4a8dd312-66cf-405e-bc05-e076f135d94c_thumbnail_portrait',
        "ages": '21+',
        "types": ['Actions', 'Horror'],
        "duration": '121 min',
      },
      {
        "title": "AVATAR",
        "rating": 5.0,
        "startDate": '2023-12-15',
        "imageURL":
            'https://www.originalfilmart.com/cdn/shop/products/Avatar_2009_french_original_film_art_a.jpg?v=1593823743',
        "ages": '21+',
        "types": ['Actions'],
        "duration": '121 min',
      },
      {
        "title": "MAGIC",
        "rating": 2.0,
        "startDate": '2023-12-12',
        "imageURL":
            'https://i.pinimg.com/474x/27/05/37/270537314a10cbea149beadaef75a07b.jpg',
        "ages": '14+',
        "types": ['Drama'],
        "duration": '121 min',
      },
      {
        "title": "KITA NIKAH YUK!",
        "rating": 4.0,
        "startDate": '2023-12-17',
        "imageURL":
            'https://i.pinimg.com/474x/82/71/81/8271817666e81e80e890353e45aee096.jpg',
        "ages": '21+',
        "types": ['Comedy'],
        "duration": '121 min',
      },
      {
        "title": "RAJAWALI",
        "rating": 3.0,
        "startDate": '2023-12-20',
        "imageURL":
            'https://i.pinimg.com/474x/58/9f/74/589f74486eda467ce0bec8914817c644.jpg',
        "ages": '17+',
        "types": ['Actions', 'Drama'],
        "duration": '121 min',
      },
      {
        "title": "KUNGFU PANDA 2",
        "rating": 5.0,
        "startDate": '2023-12-21',
        "imageURL":
            'https://i.pinimg.com/564x/b9/e0/9f/b9e09f9b934a294fee7bb00084d6f967.jpg',
        "ages": '12+',
        "types": ['Actions', 'Comedy', 'Cartoons'],
        "duration": '121 min',
      },
    ];
  });
  return (res).map((e) => MovieModel.fromJson(e)).toList();
}
