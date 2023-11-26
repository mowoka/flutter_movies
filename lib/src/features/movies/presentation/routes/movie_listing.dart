import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/movies/presentation/providers/movie_listing_provider.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_listing_content.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_listing_header.dart';
import 'package:provider/provider.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  static const routeName = 'movie listing';
  static const routePath = 'movie-listing';

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<MovieListingProvider>(
        builder: (context, notifier, child) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MovieListingHeader(
                  movieSection: notifier.movieSection,
                  isShowSearchMovie: notifier.isShowSearchMovie,
                  movieListShowType: notifier.movieListShowType,
                  onChangeMovieListingSection: (movieSection) {
                    notifier.changeMovieSection(movieSection);
                  },
                  onChangeShowSearchMovie: (value) {
                    notifier.changeShowSearchMovie(value);
                  },
                  onChangeMovieListShowType: (value) {
                    notifier.changeShowMovieListType(value);
                  },
                ),
                const MovieListingContent(),
              ],
            ),
          );
        },
      ),
    );
  }
}
