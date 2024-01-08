import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_moka/src/features/movies/data/models/movie_detail_model.dart';

Future<MovieDetailModel> httpGetMovieDetail({required int movieId}) async {
  List<MovieDetailModel> res =
      await Future.delayed(const Duration(seconds: 3), () async {
    final String response =
        await rootBundle.loadString('assets/json/movie.json');
    final resBody = await json.decode(response);

    if (resBody["data"] == null) return [];

    final data = (resBody["data"] as List)
        .map((e) => MovieDetailModel.fromJson(e))
        .toList();
    return data.where((element) => element.id == movieId).toList();
  });

  if (res.isNotEmpty) {
    return res[0];
  }

  return MovieDetailModel.createEmpty();
}
