import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_detail_highlight.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_detail_seat_type.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_detail_show.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_detail_synopsis.dart';

class MovieDetailContent extends StatefulWidget {
  const MovieDetailContent({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  State<MovieDetailContent> createState() => _MovieDetailContentState();
}

class _MovieDetailContentState extends State<MovieDetailContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieDetailHighlight(),
          Divider(thickness: 3),
          MovieDetailSynopsis(),
          Divider(thickness: 3),
          MovieDetailShow(),
          Divider(thickness: 3),
          MovieDetailSeatType(),
        ],
      ),
    );
  }
}
