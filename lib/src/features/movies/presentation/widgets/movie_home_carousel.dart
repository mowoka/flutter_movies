import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_moka/src/core/presentation/provider/location_provider.dart';
import 'package:movie_moka/src/features/movies/presentation/routes/movie_listing_search_location.dart';
import 'package:provider/provider.dart';

class MovieHomeCarousel extends StatefulWidget {
  const MovieHomeCarousel({
    super.key,
  });

  @override
  State<MovieHomeCarousel> createState() => _MovieHomeCarouselState();
}

class _MovieHomeCarouselState extends State<MovieHomeCarousel> {
  int currentIndex = 0;
  final List<String> bannerPromo = [
    'promo_01.jpeg',
    'promo_02.png',
    'promo_03.jpg',
    'promo_04.jpeg',
    'promo_05.jpeg',
    'promo_06.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_pin,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        child: Consumer<LocationProvider>(
                          builder: (context, notifier, child) {
                            return InkWell(
                              onTap: () {
                                GoRouter.of(context).pushNamed(
                                  MovieListingSearchLocation.routeName,
                                );
                              },
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      notifier.location,
                                      style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 20,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Stack(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 820 / 312,
                            autoPlayInterval: const Duration(seconds: 2),
                            disableCenter: true,
                            viewportFraction: 1,
                            enlargeCenterPage: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            }),
                        items: bannerPromo.map<Widget>((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage('assets/promo/$i'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Positioned(
                        bottom: 4,
                        left: 20,
                        child: DotsIndicator(
                          dotsCount: bannerPromo.length,
                          position: currentIndex.toDouble(),
                          decorator: DotsDecorator(
                            color: Colors.grey.shade500,
                            activeColor: Colors.grey.shade600,
                            size: const Size.square(8.0),
                            activeSize: const Size(20.0, 8.0),
                            activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(
          color: Colors.black45,
        ),
      ],
    );
  }
}
