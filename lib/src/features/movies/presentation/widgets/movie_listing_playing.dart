import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_ink_well.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie_listing_entity.dart';
import 'package:movie_moka/src/features/movies/presentation/routes/movie_detail.dart';

class MovieListingPlaying extends StatefulWidget {
  const MovieListingPlaying({
    super.key,
    required this.movieListShowType,
    required this.movies,
    this.isLoading = false,
  });

  final MovieListShowType movieListShowType;
  final List<Movie> movies;
  final bool isLoading;

  @override
  State<MovieListingPlaying> createState() => _MovieListingPlayingState();
}

class _MovieListingPlayingState extends State<MovieListingPlaying> {
  Widget _renderLoadingWidget({
    required bool isLoading,
    required Widget child,
  }) {
    if (isLoading) {
      return SizedBox(
        height: 650,
        child: child,
      );
    }

    return Expanded(child: child);
  }

  @override
  Widget build(BuildContext context) {
    final isGridView = widget.movieListShowType == MovieListShowType.grid;

    if (isGridView) {
      return _renderLoadingWidget(
        isLoading: widget.isLoading,
        child: GridView.count(
          primary: true,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          crossAxisSpacing: 20,
          childAspectRatio: 300 / 520,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            for (final item in widget.movies)
              MokaInkWell(
                onTap: () {
                  GoRouter.of(context).pushNamed(
                    MovieDetail.routeName,
                    queryParams: {
                      "movieId": item.id.toString(),
                    },
                  );
                },
                child: GridMovieItem(
                  movieImageUrl: item.imageUrl,
                  title: item.title,
                ),
              ),
          ],
        ),
      );
    }
    return _renderLoadingWidget(
      isLoading: widget.isLoading,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: ListView.separated(
          itemCount: widget.movies.length,
          itemBuilder: (BuildContext context, int index) {
            return MokaInkWell(
              onTap: () {
                GoRouter.of(context).pushNamed(
                  MovieDetail.routeName,
                  queryParams: {
                    "movieId": widget.movies[index].id.toString(),
                  },
                );
              },
              child: ListMovieItem(
                movieImageURL: widget.movies[index].imageUrl,
                title: widget.movies[index].title,
                rating: widget.movies[index].rating,
                ages: widget.movies[index].ages,
                duration: widget.movies[index].duration,
                types: widget.movies[index].types,
              ),
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
