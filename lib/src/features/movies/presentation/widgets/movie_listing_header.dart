import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_moka/src/features/movies/presentation/providers/movie_listing_provider.dart';
import 'package:movie_moka/src/features/movies/presentation/routes/movie_listing_search_location.dart';
import 'package:provider/provider.dart';

class MovieListingHeader extends StatefulWidget {
  const MovieListingHeader({super.key});

  @override
  State<MovieListingHeader> createState() => _MovieListingHeaderState();
}

class _MovieListingHeaderState extends State<MovieListingHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 3),
      child: const Column(
        children: [
          OptionsHeader(),
          OptionsViewHeader(),
        ],
      ),
    );
  }
}

class OptionsViewHeader extends StatelessWidget {
  const OptionsViewHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      color: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_pin,
                  size: 20,
                  color: Colors.white,
                ),
                Consumer<MovieListingProvider>(
                  builder: (context, notifier, child) {
                    return SizedBox(
                      child: InkWell(
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
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 3),
            child: Row(children: [
              InkWell(
                onTap: () {},
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: const Icon(
                  Icons.grid_view,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 5),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.view_list,
                  color: Colors.white,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

class OptionsHeader extends StatelessWidget {
  const OptionsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              GoRouter.of(context).pop();
            },
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
          Center(
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Playing',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Upcoming',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: const Icon(
              Icons.search,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
