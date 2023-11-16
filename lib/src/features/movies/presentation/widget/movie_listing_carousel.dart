import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_moka/src/features/movies/presentation/providers/movie_listing_provider.dart';
import 'package:movie_moka/src/features/movies/presentation/routes/movie_listing_search_location.dart';
import 'package:provider/provider.dart';

class MovieListingCarousel extends StatefulWidget {
  const MovieListingCarousel({
    super.key,
    required this.location,
  });

  final String location;

  @override
  State<MovieListingCarousel> createState() => _MovieListingCarouselState();
}

class _MovieListingCarouselState extends State<MovieListingCarousel> {
  final List<String> bannerPromo = [
    'https://pinkbike-movie.com/wp-content/uploads/2019/10/Pink_Bike_Movie_Promotional-1.jpg',
    'https://www.mimamuseum.eu/app/assets/uploads/2021/06/MM2105-Banner-facebook-cover-820x312-copie.png',
    'https://stageonewi.org/wp-content/uploads/2022/02/Pillowman-820x312-1.jpg',
    'https://pugetsoundkeeper.org/wp-content/uploads/2023/05/Against-the-Current-Banner-820x312-1.jpg',
    'https://diskingdom.com/wp-content/uploads/2016/11/see-the-video-of-alessia-caras-version-of-how-far-ill-go-from-moana-moanaevent-820x312.jpg',
    'https://www.stagecoachtc.com/wp-content/uploads/2023/06/School-of-Rock-820x312-1.jpg'
  ];

  int currentIndex = 0;

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
                        child: Consumer<MovieListingProvider>(
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
                                      widget.location,
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
                                    image: NetworkImage(i),
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
