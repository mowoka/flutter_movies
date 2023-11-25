import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/movies/presentation/providers/movie_listing_provider.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_home_carousel.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_home_food_drinks.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_home_now_playing.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_home_promo.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_home_special_feature.dart';
import 'package:provider/provider.dart';

class MovieHome extends StatefulWidget {
  const MovieHome({super.key});

  static const routeName = 'movie home';
  static const routePath = '/';

  @override
  State<MovieHome> createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<MovieListingProvider>(
            builder: (context, notifier, child) {
              return MovieHomeCarousel(
                location: notifier.location,
              );
            },
          ),
          const MovieHomeNowPlaying(),
          const MovieHomePromo(),
          const MovieHomeFoodAndDrinks(),
          const MovieHomeSpecialFeature(),
        ],
      ),
    );
  }
}
