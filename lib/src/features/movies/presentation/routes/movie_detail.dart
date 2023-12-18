import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_bouncing.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_ink_well.dart';
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

  ScrollController _scrollController = ScrollController();
  Color arrowBackColor = Colors.white;
  bool showButtonBookNow = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      if (_scrollController.offset > 0) {
        showButtonBookNow = false;
      } else {
        showButtonBookNow = true;
      }
    });
    setState(() {
      if (_scrollController.offset < 150) {
        arrowBackColor = Colors.white;
      } else if (_scrollController.offset < 300) {
        arrowBackColor = Colors.grey.shade300;
      } else {
        arrowBackColor = Colors.black;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          MovieDetailContent(
            scrollController: _scrollController,
          ),
          Positioned(
            top: 40,
            left: 10,
            child: SizedBox(
              height: 40,
              width: 40,
              child: MokaInkWell(
                onTap: () {
                  GoRouter.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: arrowBackColor,
                  size: 30,
                ),
              ),
            ),
          ),
          if (showButtonBookNow)
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  width: 100,
                  height: 60,
                  color: Colors.transparent,
                  child: Center(
                    child: MokaInkWell(
                      onTap: () {
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        height: 30,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Book Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 3),
                            MokaBouncing(
                              child: Icon(
                                Icons.arrow_downward,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
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
