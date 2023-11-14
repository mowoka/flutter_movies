import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/movies/presentation/widget/movie_listing_carousel.dart';
import 'package:movie_moka/src/features/movies/presentation/widget/movie_listing_food_drinks.dart';
import 'package:movie_moka/src/features/movies/presentation/widget/movie_listing_now_playing.dart';
import 'package:movie_moka/src/features/movies/presentation/widget/movie_listing_promo.dart';
import 'package:movie_moka/src/features/movies/presentation/widget/movie_listing_special_feature.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  static const routeName = 'movie listing';
  static const routePath = '/';

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieListingCarousel(),
          MovieListingNowPlaying(),
          MovieListingPromo(),
          MovieListingFoodAndDrinks(),
          MovieListingSpecialFeature(),
        ],
      ),
    );
  }
}
