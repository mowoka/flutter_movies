import 'package:flutter/material.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  static const routeName = 'movie listing';
  static const routePath = '/';

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Movie Lisitng'),
    );
  }
}
