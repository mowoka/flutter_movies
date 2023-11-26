import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_home_now_playing.dart';

class MovieListingContent extends StatefulWidget {
  const MovieListingContent({super.key});

  @override
  State<MovieListingContent> createState() => _MovieListingContentState();
}

class _MovieListingContentState extends State<MovieListingContent> {
  final List<Movie> movies = [
    Movie(
      title: 'Dilan',
      rating: 4.5,
      startDate: '2023-11-20',
      imageURL:
          'https://s2.bukalapak.com/img/7057854092/large/poster_film_dilan.jpeg',
    ),
    Movie(
      title: "Matix: Croine a I'incroyable",
      rating: 3.5,
      startDate: '2023-11-22',
      imageURL:
          'https://www.originalfilmart.com/cdn/shop/products/the_matrix_1999_fr_original_film_art_a.jpg?v=1640646540',
    ),
    Movie(
      title: 'KADET 1947',
      rating: 4,
      startDate: '2023-11-21',
      imageURL:
          'https://asset.kompas.com/crops/7Ubrj5X59RzzppNgNDS6x6gBRrM=/31x9:872x1131/300x400/data/photo/2021/10/29/617b75cc70698.jpeg',
    ),
    Movie(
      title: 'JOKER',
      rating: 5,
      startDate: '2023-11-25',
      imageURL:
          'https://asset.kompas.com/crop/39x0:1051x1349/300x400/data/photo/2019/04/03/2579847035.jpg',
    ),
    Movie(
      title: 'Bankit',
      rating: 4,
      startDate: '2023-11-15',
      imageURL:
          'https://assets.kompasiana.com/items/album/2016/07/30/poster-film-bangkit-cinemags-id-579c5a41d77a6127153c0385.jpg?t=o&v=300',
    ),
    Movie(
      title: 'AKAL',
      rating: 3.5,
      startDate: '2023-12-15',
      imageURL:
          'https://d10j0070m15qtm.cloudfront.net/uploads/4a8dd312-66cf-405e-bc05-e076f135d94c_thumbnail_portrait',
    ),
    Movie(
      title: 'AVATAR',
      rating: 5,
      startDate: '2023-12-15',
      imageURL:
          'https://www.originalfilmart.com/cdn/shop/products/Avatar_2009_french_original_film_art_a.jpg?v=1593823743',
    ),
    Movie(
      title: 'MAGIC',
      rating: 2,
      startDate: '2023-12-12',
      imageURL:
          'https://i.pinimg.com/474x/27/05/37/270537314a10cbea149beadaef75a07b.jpg',
    ),
    Movie(
      title: 'KITA NIKAH YUK!',
      rating: 4,
      startDate: '2023-12-17',
      imageURL:
          'https://i.pinimg.com/474x/82/71/81/8271817666e81e80e890353e45aee096.jpg',
    ),
    Movie(
      title: 'RAJAWALI',
      rating: 3,
      startDate: '2023-12-20',
      imageURL:
          'https://i.pinimg.com/474x/58/9f/74/589f74486eda467ce0bec8914817c644.jpg',
    ),
    Movie(
      title: 'KUNGFU PANDA 2',
      rating: 5,
      startDate: '2023-12-21',
      imageURL:
          'https://i.pinimg.com/564x/b9/e0/9f/b9e09f9b934a294fee7bb00084d6f967.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        primary: true,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        crossAxisSpacing: 20,
        childAspectRatio: 300 / 520,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          for (final item in movies)
            GridMovieItem(
              movieImageUrl: item.imageURL,
              title: item.title,
            ),
        ],
      ),
    );
  }
}

class GridMovieItem extends StatelessWidget {
  const GridMovieItem({
    super.key,
    required this.movieImageUrl,
    required this.title,
  });

  final String movieImageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 300,
            height: 240,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                image: NetworkImage(
                  movieImageUrl,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
