import 'package:flutter/material.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  static const routeName = 'Movie Listing';
  static const routePath = '/';

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text('Movie Lisitng'),
        ),
      ),
    );
  }
}
