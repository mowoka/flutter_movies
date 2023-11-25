import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/movies/presentation/providers/movie_listing_provider.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_listing_carousel.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_listing_food_drinks.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_listing_now_playing.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_listing_promo.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_listing_special_feature.dart';
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
              return MovieListingCarousel(
                location: notifier.location,
              );
            },
          ),
          const MovieListingNowPlaying(),
          const MovieListingPromo(),
          const MovieListingFoodAndDrinks(),
          const MovieListingSpecialFeature(),
        ],
      ),
    );
  }
}
