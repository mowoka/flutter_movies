import 'package:movie_moka/src/features/movies/data/models/movie_model.dart';

Future<List<MovieModel>> httpGetMovieUpcoming() async {
  final res = await Future.delayed(const Duration(seconds: 3), () {
    return [
      {
        "title": "Mangkujiwo",
        "rating": 4.0,
        "startDate": "2023-12-20",
        "imageURL":
            'https://asset.kompas.com/crops/tiBQxUI8HsvJp7O7LG_wr8mzEEk=/0x3:1200x1603/300x400/data/photo/2020/01/30/5e3258344a374.jpg',
        "ages": '15+',
        "types": ['Horor'],
        "duration": '120 min',
        "totalFavorite": 80,
      },
      {
        "title": "Tiger 3",
        "rating": 4.0,
        "startDate": "2023-12-25",
        "imageURL":
            'https://m.media-amazon.com/images/M/MV5BYzQwMGZlYTUtODUwNi00ZjQxLWEzODAtZGU3Zjc0MmNhMzhkXkEyXkFqcGdeQXVyNTkzNDQ4ODc@._V1_.jpg',
        "ages": '15+',
        "types": ['Action'],
        "duration": '120 min',
        "totalFavorite": 20,
      },
      {
        "title": "Avatar 3: The Way of Water",
        "rating": 5.0,
        "startDate": "2023-12-25",
        "imageURL":
            'https://www.puriindahmall.co.id/assets/img/news/1670915741_77_0_avatar.jpg',
        "ages": '15+',
        "types": ['Action', 'Drama'],
        "duration": '120 min',
        "totalFavorite": 120,
      },
      {
        "title": "Anugrah Cinta",
        "rating": 3.0,
        "startDate": "2023-12-12",
        "imageURL":
            'https://i.pinimg.com/474x/62/4a/70/624a704467f273c54e98c9619cfad6b8.jpg',
        "ages": '15+',
        "types": ['Drama', 'Romance'],
        "duration": '120 min',
        "totalFavorite": 12,
      },
      {
        "title": "Le Grand Voyage",
        "rating": 2.0,
        "startDate": "2023-12-10",
        "imageURL":
            'https://assets-a1.kompasiana.com/items/album/2022/04/20/grand-voyage-625f5789bb448605d813b909.jpg',
        "ages": '15+',
        "types": ['Drama'],
        "duration": '122 min',
        "totalFavorite": 2,
      },
      {
        "title": "DOGMAN",
        "rating": 4.0,
        "startDate": "2023-12-15",
        "imageURL":
            'https://i.ebayimg.com/images/g/S68AAOSwXOxlEDlb/s-l400.jpg',
        "ages": '12+',
        "types": ['Drama'],
        "duration": '122 min',
        "totalFavorite": 15,
      },
      {
        "title": "Teen Beach",
        "rating": 4.0,
        "startDate": "2023-12-22",
        "imageURL":
            'https://upload.wikimedia.org/wikipedia/id/0/06/Teen_Beach_Movie_poster.jpg',
        "ages": '12+',
        "types": ['Drama', 'Romance', 'School'],
        "duration": '122 min',
        "totalFavorite": 60,
      },
      {
        "title": "GATEWAY",
        "rating": 4.0,
        "startDate": "2023-12-29",
        "imageURL":
            'https://www.originalfilmart.com/cdn/shop/products/the_getaway_1972_french_original_film_art_a_85f9db78-88bd-4ba7-b504-4e0806dfe0d5.jpg?v=1638491543',
        "ages": '12+',
        "types": ['Drama', 'Action'],
        "duration": '111 min',
        "totalFavorite": 72,
      },
      {
        "title": "Lukisan Awan",
        "rating": 5.0,
        "startDate": "2023-12-24",
        "imageURL":
            'https://deepublishstore.com/wp-content/uploads/2019/01/Lukisan-Awan-Marjiyati-Convert-depan-300x400.jpg',
        "ages": '12+',
        "types": ['Drama', 'Comedy', 'Friendly'],
        "duration": '111 min',
        "totalFavorite": 120,
      },
      {
        "title": "ALI",
        "rating": 5.0,
        "startDate": "2023-12-26",
        "imageURL":
            'https://cdn.filmfestivalflix.com/wp-content/fff-uploads-bucket/2023/10/Ali-vs-Ali_Portrait-Poster-300x400.jpg',
        "ages": '12+',
        "types": ['Drama'],
        "duration": '111 min',
        "totalFavorite": 90,
      },
      {
        "title": "Matilda",
        "rating": 4.0,
        "startDate": "2023-12-26",
        "imageURL":
            'https://www.musicshopeurope.com/product/image/medium/hl01154542_0.jpg',
        "ages": '12+',
        "types": ['Drama'],
        "duration": '111 min',
        "totalFavorite": 2,
      },
    ];
  });
  return (res).map((e) => MovieModel.fromJson(e)).toList();
}
