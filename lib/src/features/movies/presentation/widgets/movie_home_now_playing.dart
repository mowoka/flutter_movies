import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_ink_well.dart';
import 'package:movie_moka/src/core/utils/data/dummy_data.dart';
import 'package:movie_moka/src/core/utils/date_formatter.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie.dart';
import 'package:movie_moka/src/features/movies/presentation/providers/movie_home_provider.dart';
import 'package:movie_moka/src/features/movies/presentation/routes/movie_detail.dart';
import 'package:movie_moka/src/features/movies/presentation/routes/movie_listing.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_home_header.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MovieHomeNowPlaying extends StatefulWidget {
  const MovieHomeNowPlaying({super.key});

  @override
  State<MovieHomeNowPlaying> createState() => _MovieHomeNowPlayingState();
}

class _MovieHomeNowPlayingState extends State<MovieHomeNowPlaying> {
  Future<List<Movie>> _getMovieNowPlaying() async {
    final provider = Provider.of<MovieHomeProvider>(context, listen: false);

    final res = await provider.getMovieNowPlayingList();

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: _getMovieNowPlaying(),
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Skeletonizer(
            enabled: true,
            child: MovieNowPlayingContent(movies: dummyMovies),
          );
        }
        if (snapshot.data == null) {
          return Container();
        }

        return MovieNowPlayingContent(movies: snapshot.data!);
      },
    );
  }
}

class MovieNowPlayingContent extends StatelessWidget {
  const MovieNowPlayingContent({
    super.key,
    required this.movies,
  });

  final List<Movie> movies;

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
                        GoRouter.of(context).pushNamed(
                          MovieDetail.routeName,
                          queryParams: {
                            "movieId": movies[index].id.toString(),
                          },
                        );
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
                                    movies[index].imageUrl,
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

class MovieUI {
  MovieUI({
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
