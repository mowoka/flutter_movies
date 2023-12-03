import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_ink_well.dart';
import 'package:movie_moka/src/core/utils/date_formatter.dart';
import 'package:movie_moka/src/features/movies/presentation/routes/movie_detail.dart';
import 'package:movie_moka/src/features/movies/presentation/routes/movie_listing.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_home_header.dart';

class MovieHomeNowPlaying extends StatefulWidget {
  const MovieHomeNowPlaying({super.key});

  @override
  State<MovieHomeNowPlaying> createState() => _MovieHomeNowPlayingState();
}

class _MovieHomeNowPlayingState extends State<MovieHomeNowPlaying> {
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
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            children: [
              MovieHomeHeader(
                title: 'Now Playing',
                subTitle: 'Exciting movies that will entetain you!',
                onTap: () {
                  GoRouter.of(context).pushNamed(MovieListing.routeName);
                },
              ),
              SizedBox(
                width: double.infinity,
                height: 340,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MokaInkWell(
                      onTap: () {
                        GoRouter.of(context).pushNamed(MovieDetail.routeName);
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 266,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    movies[index].imageURL,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              movies[index].title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: RatingBar.builder(
                                      initialRating: movies[index].rating,
                                      itemSize: 15,
                                      allowHalfRating: true,
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      ignoreGestures: true,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      onRatingUpdate: (rating) {},
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star_rate_rounded,
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    dateFormatter(
                                        movies[index].startDate, 'dd MMM'),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        const Divider(
          color: Colors.black45,
        ),
      ],
    );
  }
}

class Movie {
  Movie({
    required this.title,
    required this.startDate,
    required this.imageURL,
    required this.rating,
    this.ages,
    this.duration,
    this.types,
    this.totalFavorite,
  });

  final String title;
  final String imageURL;
  final String startDate;
  final double rating;
  String? ages;
  String? duration;
  List<String>? types;
  int? totalFavorite;
}
