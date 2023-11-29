import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_detail_content.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({super.key});

  static const routeName = 'movie detail';
  static const routePath = 'movie-detail';

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  final movieDetail = MovieDetailData(
    title: 'Dilan',
    rating: 4.5,
    startDate: '2023-11-20',
    imageURL:
        'https://s2.bukalapak.com/img/7057854092/large/poster_film_dilan.jpeg',
    totalReviewer: 104,
    synopsis: '<p>Synopsis</p>',
    ages: '13+',
    duration: '114 min',
    types: ['Drama', 'Romance'],
    totalFavorite: 140,
    totalWatchlist: 260,
  );

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: MovieDetailContent(),
    );
  }
}

class MovieDetailData {
  MovieDetailData({
    required this.title,
    required this.startDate,
    required this.imageURL,
    required this.rating,
    required this.synopsis,
    required this.totalReviewer,
    this.ages,
    this.duration,
    this.types,
    this.totalFavorite,
    this.totalWatchlist,
  });

  final String title;
  final String imageURL;
  final String startDate;
  final double rating;
  final String synopsis;
  final int totalReviewer;
  String? ages;
  String? duration;
  List<String>? types;
  int? totalFavorite;
  int? totalWatchlist;
}
