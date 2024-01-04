import 'dart:convert';

import 'package:movie_moka/src/core/domain/entities/shared_preferences_with_expiry.dart';
import 'package:movie_moka/src/features/movies/data/models/movie_model.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie.dart';

class SharedPrefMovieUpcoming extends SharedPrefWithExpiry<List<Movie>> {
  SharedPrefMovieUpcoming({
    required super.sp,
    required super.spKey,
    required super.expiredInSeconds,
  });

  @override
  List<Movie>? get() {
    final str = sp.getString(spKey);
    if (str == null) return null;
    final json = jsonDecode(str);

    final movieModel =
        (json as List).map((e) => MovieModel.fromJson(e)).toList();
    return movieModel.map((e) => e.toEntity()).toList();
  }

  @override
  void set(List<Movie> value) {
    final json = value
        .map(
          (e) => {
            "title": e.title,
            "rating": e.rating,
            "startDate": e.startDate,
            "imageURL": e.imageUrl,
            "ages": e.imageUrl,
            "types": e.types,
            "duration": e.duration,
            "totalFavorite": e.totalFavorite,
          },
        )
        .toList();
    final str = jsonEncode(json);
    sp.setString(spKey, str);
    super.set(value);
  }
}
