import 'package:movie_moka/src/features/movies/domain/entities/movie.dart';

class MovieModel {
  MovieModel({
    required this.id,
    required this.title,
    required this.startDate,
    required this.imageURL,
    required this.rating,
    this.ages,
    this.duration,
    this.types,
    this.totalFavorite,
  });

  final int id;
  final String title;
  final String imageURL;
  final String startDate;
  final double rating;
  String? ages;
  String? duration;
  List<String>? types;
  int? totalFavorite;

  factory MovieModel.fromJson(dynamic json) {
    MovieModel mm = MovieModel(
      id: json['id'],
      title: json['title'],
      startDate: json['startDate'],
      imageURL: json['imageURL'],
      rating: json['rating'],
    );

    if (json['ages'] != null) {
      mm.ages = json['ages'];
    }
    if (json['duration'] != null) {
      mm.ages = json['duration'];
    }
    if (json['types'] != null) {
      mm.types = (json['types'] as List).map((e) => e.toString()).toList();
    }
    if (json['totalFavorite'] != null) {
      mm.totalFavorite = json['totalFavorite'];
    }

    return mm;
  }

  Movie toEntity() {
    return Movie()
      ..id = id
      ..title = title
      ..startDate = startDate
      ..imageUrl = imageURL
      ..rating = rating
      ..ages = ages ?? ''
      ..duration = duration ?? ''
      ..types = types ?? []
      ..totalFavorite = totalFavorite ?? 0;
  }
}
