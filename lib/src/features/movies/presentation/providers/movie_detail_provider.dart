import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie_detail_entity.dart';
import 'package:movie_moka/src/features/movies/domain/repositories/movie_detail.dart';
import 'package:movie_moka/src/features/movies/domain/usecases/get_movie_detail.dart';

class MovieDetailProvder extends ChangeNotifier {
  final MovieDetailRepository repository;

  // initialize variable
  late final GetMovieDetail getMovieDetail;

  MovieDetailProvder({required this.repository}) {
    getMovieDetail = GetMovieDetail(repository: repository);
  }

  // register function
  Future<MovieDetailEntity> getMovieDetailData({required int movieId}) async {
    return await getMovieDetail.execute(movieId: movieId);
  }
}
