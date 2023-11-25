import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_listing_header.dart';

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
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            MovieListingHeader(),
          ],
        ),
      ),
    );
  }
}
