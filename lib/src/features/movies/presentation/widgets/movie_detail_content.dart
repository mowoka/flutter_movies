import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_detail_highlight.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_detail_show.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_detail_synopsis.dart';

class MovieDetailContent extends StatefulWidget {
  const MovieDetailContent({super.key});

  @override
  State<MovieDetailContent> createState() => _MovieDetailContentState();
}

class _MovieDetailContentState extends State<MovieDetailContent> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieDetailHighlight(),
          Divider(thickness: 3),
          MovieDetailSynopsis(),
          Divider(thickness: 3),
          MovieDetailShow(),
          Divider(thickness: 3),
        ],
      ),
    );
  }
}
