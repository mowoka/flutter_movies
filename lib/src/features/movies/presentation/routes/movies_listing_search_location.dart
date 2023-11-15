import 'package:flutter/material.dart';

class MovieListingSearchLocation extends StatefulWidget {
  const MovieListingSearchLocation({super.key});

  static const routeName = 'movie listing search location';
  static const routePath = 'movie-search-location';

  @override
  State<MovieListingSearchLocation> createState() =>
      _MovieListingSearchLocationState();
}

class _MovieListingSearchLocationState
    extends State<MovieListingSearchLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: const Center(child: Text('SEarch Location')),
      ),
    );
  }
}
