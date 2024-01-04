import 'package:flutter/material.dart';
import 'package:movie_moka/src/core/utils/data/dummy_data.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie_listing_entity.dart';
import 'package:movie_moka/src/features/movies/presentation/providers/movie_listing_provider.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_listing_playing.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_listing_upcoming.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MovieListingContent extends StatefulWidget {
  const MovieListingContent({
    super.key,
    required this.movieListShowType,
    required this.movieListingSection,
  });

  final MovieListShowType movieListShowType;
  final MovieListingSection movieListingSection;

  @override
  State<MovieListingContent> createState() => _MovieListingContentState();
}

class _MovieListingContentState extends State<MovieListingContent> {
  Future<List<Movie>> _getMoviePlaying() async {
    final provider = Provider.of<MovieListingProvider>(context, listen: false);
    return await provider.getMoviePlaying();
  }

  Future<List<Movie>> _getMovieUpcoming() async {
    final provider = Provider.of<MovieListingProvider>(context, listen: false);
    return await provider.getMovieUpcomingList();
  }

  @override
  Widget build(BuildContext context) {
    final sectionPlaying =
        widget.movieListingSection == MovieListingSection.playing;

    if (sectionPlaying) {
      return FutureBuilder<List<Movie>>(
          future: _getMoviePlaying(),
          builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Skeletonizer(
                enabled: true,
                child: MovieListingPlaying(
                  movieListShowType: widget.movieListShowType,
                  movies: dummyMovies,
                  isLoading:
                      snapshot.connectionState == ConnectionState.waiting,
                ),
              );
            }
            if (snapshot.data == null) {
              return Container();
            }
            return MovieListingPlaying(
              movieListShowType: widget.movieListShowType,
              movies: snapshot.data!,
            );
          });
    }

    return FutureBuilder<List<Movie>>(
      future: _getMovieUpcoming(),
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Skeletonizer(
            enabled: true,
            child: MovieListingUpcoming(
              movieListShowType: widget.movieListShowType,
              upcomingMovies: dummyMovies,
              isLoading: snapshot.connectionState == ConnectionState.waiting,
            ),
          );
        }
        if (snapshot.data == null) {
          return Container();
        }

        return MovieListingUpcoming(
          movieListShowType: widget.movieListShowType,
          upcomingMovies: snapshot.data!,
        );
      },
    );
  }
}
