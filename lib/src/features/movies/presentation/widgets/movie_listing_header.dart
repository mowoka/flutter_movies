import 'package:flutter/material.dart';

class MovieListingHeader extends StatefulWidget {
  const MovieListingHeader({super.key});

  @override
  State<MovieListingHeader> createState() => _MovieListingHeaderState();
}

class _MovieListingHeaderState extends State<MovieListingHeader> {
  @override
  Widget build(BuildContext context) {
    return const Text('header');
  }
}
