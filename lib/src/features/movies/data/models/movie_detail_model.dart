import 'package:movie_moka/src/features/movies/domain/entities/movie_detail_entity.dart';

class MovieDetailModel {
  MovieDetailModel({
    required this.id,
    required this.title,
    required this.rating,
    required this.startDate,
    required this.imageURL,
    required this.totalReviewer,
    required this.synopsis,
    required this.duration,
    required this.types,
    required this.ages,
    required this.totalFavorite,
    required this.totalWatchlist,
  });

  final int id;
  final String title;
  final double rating;
  final String startDate;
  final String imageURL;
  final int totalReviewer;
  final String synopsis;
  final String ages;
  final String duration;
  final List<String> types;
  final int totalFavorite;
  final int totalWatchlist;

  factory MovieDetailModel.fromJson(dynamic json) {
    return MovieDetailModel(
      id: json['id'],
      title: json['title'],
      rating: json['rating'],
      startDate: json['startDate'],
      imageURL: json['imageURL'],
      totalReviewer: json['totalReviewer'],
      synopsis: json['synopsis'],
      duration: json['duration'],
      types: (json['types'] as List).map((e) => e.toString()).toList(),
      ages: json['ages'],
      totalFavorite: json['totalFavorite'],
      totalWatchlist: json['totalWatchlist'],
    );
  }

  factory MovieDetailModel.createEmpty() {
    return MovieDetailModel(
      id: 0,
      title: '',
      rating: 0,
      startDate: '',
      imageURL: '',
      totalReviewer: 0,
      synopsis: '',
      duration: '',
      types: [],
      ages: '',
      totalFavorite: 0,
      totalWatchlist: 0,
    );
  }

  MovieDetailEntity toEntity() {
    return MovieDetailEntity()
      ..id = id
      ..title = title
      ..rating = rating
      ..startDate = startDate
      ..imageURL = imageURL
      ..totalReviewer = totalReviewer.toString()
      ..synopsis = synopsis
      ..ages = ages
      ..duration = duration
      ..types = types
      ..totalFavorite = totalFavorite
      ..totalWatchlist = totalWatchlist;
  }
}
