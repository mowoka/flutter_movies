import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_bouncing.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_ink_well.dart';
import 'package:movie_moka/src/core/utils/data/dummy_data.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie_detail_entity.dart';
import 'package:movie_moka/src/features/movies/presentation/providers/movie_detail_provider.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_detail_content.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MovieDetailState {
  MovieDetailState({
    required this.movieId,
  });

  final int movieId;
}

class MovieDetail extends StatefulWidget {
  const MovieDetail({
    super.key,
    required this.payload,
  });

  final MovieDetailState payload;
  static const routeName = 'movie detail';
  static const routePath = 'movie-detail';

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
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

  Future<MovieDetailEntity> _getMovieDetail() async {
    final movieId = widget.payload.movieId;
    final provider = Provider.of<MovieDetailProvder>(context, listen: false);
    return await provider.getMovieDetailData(movieId: movieId);
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
          FutureBuilder<MovieDetailEntity>(
            future: _getMovieDetail(),
            builder: (
              BuildContext context,
              AsyncSnapshot<MovieDetailEntity> snapshot,
            ) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Skeletonizer(
                  enabled: true,
                  child: MovieDetailContent(
                    scrollController: _scrollController,
                    movieDetail: dummyMovieDetail,
                  ),
                );
              }

              if (snapshot.data == null) {
                return Container();
              }

              return MovieDetailContent(
                scrollController: _scrollController,
                movieDetail: snapshot.data!,
              );
            },
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
