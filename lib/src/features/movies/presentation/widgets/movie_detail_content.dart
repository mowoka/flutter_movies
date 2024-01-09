import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie_detail_entity.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_detail_highlight.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_detail_seat_type.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_detail_show.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_detail_synopsis.dart';

class MovieDetailContent extends StatefulWidget {
  const MovieDetailContent({
    super.key,
    required this.scrollController,
    required this.movieDetail,
  });

  final ScrollController scrollController;
  final MovieDetailEntity movieDetail;

  @override
  State<MovieDetailContent> createState() => _MovieDetailContentState();
}

class _MovieDetailContentState extends State<MovieDetailContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      child: MovieDetailContentUI(movieDetail: widget.movieDetail),
    );
  }
}

class MovieDetailContentUI extends StatelessWidget {
  const MovieDetailContentUI({
    super.key,
    required this.movieDetail,
  });

  final MovieDetailEntity movieDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieDetailHighlight(
          movieDetail: movieDetail,
        ),
        const Divider(thickness: 3),
        const MovieDetailSynopsis(),
        const Divider(thickness: 3),
        const MovieDetailShow(),
        const Divider(thickness: 3),
        const MovieDetailSeatType(),
      ],
    );
  }
}
