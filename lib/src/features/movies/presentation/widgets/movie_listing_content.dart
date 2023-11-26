import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie_listing_entity.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_home_now_playing.dart';

class MovieListingContent extends StatefulWidget {
  const MovieListingContent({
    super.key,
    required this.movieListShowType,
  });

  final MovieListShowType movieListShowType;

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
      ages: '15+',
      types: ['Drama', 'Comedy'],
      duration: '120 min',
    ),
    Movie(
      title: "Matix: Croine a I'incroyable",
      rating: 3.5,
      startDate: '2023-11-22',
      imageURL:
          'https://www.originalfilmart.com/cdn/shop/products/the_matrix_1999_fr_original_film_art_a.jpg?v=1640646540',
      ages: '19+',
      types: ['Actions'],
      duration: '110 min',
    ),
    Movie(
      title: 'KADET 1947',
      rating: 4,
      startDate: '2023-11-21',
      imageURL:
          'https://asset.kompas.com/crops/7Ubrj5X59RzzppNgNDS6x6gBRrM=/31x9:872x1131/300x400/data/photo/2021/10/29/617b75cc70698.jpeg',
      ages: '17+',
      types: ['Actions', 'Comedy'],
      duration: '140 min',
    ),
    Movie(
      title: 'JOKER',
      rating: 5,
      startDate: '2023-11-25',
      imageURL:
          'https://asset.kompas.com/crop/39x0:1051x1349/300x400/data/photo/2019/04/03/2579847035.jpg',
      ages: '21+',
      types: ['Actions', 'Horror'],
      duration: '121 min',
    ),
    Movie(
      title: 'Bankit',
      rating: 4,
      startDate: '2023-11-15',
      imageURL:
          'https://assets.kompasiana.com/items/album/2016/07/30/poster-film-bangkit-cinemags-id-579c5a41d77a6127153c0385.jpg?t=o&v=300',
      ages: '16+',
      types: ['Drama'],
      duration: '98 min',
    ),
    Movie(
      title: 'AKAL',
      rating: 3.5,
      startDate: '2023-12-15',
      imageURL:
          'https://d10j0070m15qtm.cloudfront.net/uploads/4a8dd312-66cf-405e-bc05-e076f135d94c_thumbnail_portrait',
      ages: '21+',
      types: ['Actions', 'Horror'],
      duration: '121 min',
    ),
    Movie(
      title: 'AVATAR',
      rating: 5,
      startDate: '2023-12-15',
      imageURL:
          'https://www.originalfilmart.com/cdn/shop/products/Avatar_2009_french_original_film_art_a.jpg?v=1593823743',
      ages: '21+',
      types: ['Actions'],
      duration: '121 min',
    ),
    Movie(
      title: 'MAGIC',
      rating: 2,
      startDate: '2023-12-12',
      imageURL:
          'https://i.pinimg.com/474x/27/05/37/270537314a10cbea149beadaef75a07b.jpg',
      ages: '14+',
      types: ['Drama'],
      duration: '121 min',
    ),
    Movie(
      title: 'KITA NIKAH YUK!',
      rating: 4,
      startDate: '2023-12-17',
      imageURL:
          'https://i.pinimg.com/474x/82/71/81/8271817666e81e80e890353e45aee096.jpg',
      ages: '21+',
      types: ['Comedy'],
      duration: '121 min',
    ),
    Movie(
      title: 'RAJAWALI',
      rating: 3,
      startDate: '2023-12-20',
      imageURL:
          'https://i.pinimg.com/474x/58/9f/74/589f74486eda467ce0bec8914817c644.jpg',
      ages: '17+',
      types: ['Actions', 'Drama'],
      duration: '121 min',
    ),
    Movie(
      title: 'KUNGFU PANDA 2',
      rating: 5,
      startDate: '2023-12-21',
      imageURL:
          'https://i.pinimg.com/564x/b9/e0/9f/b9e09f9b934a294fee7bb00084d6f967.jpg',
      ages: '12+',
      types: ['Actions', 'Comedy', 'Cartoons'],
      duration: '121 min',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isGridView = widget.movieListShowType == MovieListShowType.grid;
    if (isGridView) {
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
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: ListView.separated(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return ListMovieItem(
              movieImageURL: movies[index].imageURL,
              title: movies[index].title,
              rating: movies[index].rating,
              ages: movies[index].ages,
              duration: movies[index].duration,
              types: movies[index].types,
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}

class ListMovieItem extends StatelessWidget {
  const ListMovieItem({
    super.key,
    required this.movieImageURL,
    required this.title,
    required this.rating,
    this.ages,
    this.duration,
    this.types,
  });

  final String movieImageURL;
  final String title;
  final double rating;
  final String? ages;
  final String? duration;
  final List<String>? types;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                image: NetworkImage(
                  movieImageURL,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                top: 6,
                bottom: 6,
                left: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 5),
                  if (types != null && types!.isNotEmpty)
                    Text(
                      types!.join(', '),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RatingBar.builder(
                        initialRating: rating,
                        itemSize: 20,
                        allowHalfRating: true,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        ignoreGestures: true,
                        itemPadding: const EdgeInsets.only(
                          right: 0.5,
                        ),
                        onRatingUpdate: (rating) {},
                        itemBuilder: (context, _) => const Icon(
                          Icons.star_rate_rounded,
                          color: Colors.amber,
                        ),
                      ),
                      if (ages != null && ages!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                          ),
                          child: Text(
                            '|   $ages   |',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                      if (duration != null && duration!.isNotEmpty)
                        Text(
                          duration!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                          ),
                        )
                    ],
                  ),
                ],
              ),
            ),
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
