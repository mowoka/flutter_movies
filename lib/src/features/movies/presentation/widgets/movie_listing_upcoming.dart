import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_ink_well.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie_listing_entity.dart';
import 'package:movie_moka/src/features/movies/presentation/routes/movie_detail.dart';

class MovieListingUpcoming extends StatefulWidget {
  const MovieListingUpcoming({
    super.key,
    required this.upcomingMovies,
    required this.movieListShowType,
    this.isLoading = false,
  });

  final MovieListShowType movieListShowType;
  final List<Movie> upcomingMovies;
  final bool isLoading;

  @override
  State<MovieListingUpcoming> createState() => _MovieListingUpcomingState();
}

class _MovieListingUpcomingState extends State<MovieListingUpcoming> {
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
          childAspectRatio: 300 / 550,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            for (final item in widget.upcomingMovies)
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
                  totalFavorite: item.totalFavorite,
                ),
              ),
          ],
        ),
      );
      // return Expanded(
      //   child:
      // );
    }
    return _renderLoadingWidget(
      isLoading: widget.isLoading,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: ListView.separated(
          itemCount: widget.upcomingMovies.length,
          itemBuilder: (BuildContext context, int index) {
            return MokaInkWell(
              onTap: () {
                GoRouter.of(context).pushNamed(
                  MovieDetail.routeName,
                  queryParams: {
                    "movieId": widget.upcomingMovies[index].id.toString(),
                  },
                );
              },
              child: ListMovieItem(
                movieImageURL: widget.upcomingMovies[index].imageUrl,
                title: widget.upcomingMovies[index].title,
                totalFavorite: widget.upcomingMovies[index].totalFavorite,
                ages: widget.upcomingMovies[index].ages,
                duration: widget.upcomingMovies[index].duration,
                types: widget.upcomingMovies[index].types,
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
    this.totalFavorite,
    this.ages,
    this.duration,
    this.types,
  });

  final String movieImageURL;
  final String title;
  final int? totalFavorite;
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (totalFavorite != null)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.favorite,
                              color: Colors.pink,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                totalFavorite!.toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
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
    this.totalFavorite,
  });

  final String movieImageUrl;
  final String title;
  final int? totalFavorite;

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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                if (totalFavorite != null)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: Colors.pink,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          totalFavorite!.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
