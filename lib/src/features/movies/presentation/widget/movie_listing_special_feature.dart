import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/movies/presentation/widget/movie_listing_header.dart';

class MovieListingSpecialFeature extends StatefulWidget {
  const MovieListingSpecialFeature({super.key});

  @override
  State<MovieListingSpecialFeature> createState() =>
      _MovieListingSpecialFeatureState();
}

class _MovieListingSpecialFeatureState
    extends State<MovieListingSpecialFeature> {
  List<String> specialFeatures = [
    'https://2.bp.blogspot.com/-Wu8iJa66dm8/XGzDrWFO7CI/AAAAAAAAEwI/2qYF9taSAPoZgD0Bg1z9FZd9Q_ABq8uCgCLcBGAs/s1600/img_20170523_172419_343-resized-500.jpg',
    'https://2.bp.blogspot.com/-Wu8iJa66dm8/XGzDrWFO7CI/AAAAAAAAEwI/2qYF9taSAPoZgD0Bg1z9FZd9Q_ABq8uCgCLcBGAs/s1600/img_20170523_172419_343-resized-500.jpg',
    'https://2.bp.blogspot.com/-Wu8iJa66dm8/XGzDrWFO7CI/AAAAAAAAEwI/2qYF9taSAPoZgD0Bg1z9FZd9Q_ABq8uCgCLcBGAs/s1600/img_20170523_172419_343-resized-500.jpg',
    'https://2.bp.blogspot.com/-Wu8iJa66dm8/XGzDrWFO7CI/AAAAAAAAEwI/2qYF9taSAPoZgD0Bg1z9FZd9Q_ABq8uCgCLcBGAs/s1600/img_20170523_172419_343-resized-500.jpg',
    'https://2.bp.blogspot.com/-Wu8iJa66dm8/XGzDrWFO7CI/AAAAAAAAEwI/2qYF9taSAPoZgD0Bg1z9FZd9Q_ABq8uCgCLcBGAs/s1600/img_20170523_172419_343-resized-500.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            children: [
              MovieListingHeader(
                title: "Moka Special Feature",
                subTitle: "Exclusive experience only at Moka!",
                onTap: () {},
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: specialFeatures.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      width: 100,
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          image: DecorationImage(
                            image: NetworkImage(
                              specialFeatures[index],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
