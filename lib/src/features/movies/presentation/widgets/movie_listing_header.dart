import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie_listing_entity.dart';
import 'package:movie_moka/src/features/movies/presentation/providers/movie_listing_provider.dart';
import 'package:movie_moka/src/features/movies/presentation/routes/movie_listing_search_location.dart';
import 'package:provider/provider.dart';

typedef OnChangeMovieListingSection = Function(
  MovieListingSection movieSection,
);

typedef OnChangeShowSearchMovie = Function(bool value);

class MovieListingHeader extends StatefulWidget {
  const MovieListingHeader({
    super.key,
    required this.onChangeMovieListingSection,
    required this.movieSection,
    required this.isShowSearchMovie,
    required this.onChangeShowSearchMovie,
  });

  final OnChangeMovieListingSection onChangeMovieListingSection;
  final MovieListingSection movieSection;
  final bool isShowSearchMovie;
  final OnChangeShowSearchMovie onChangeShowSearchMovie;

  @override
  State<MovieListingHeader> createState() => _MovieListingHeaderState();
}

class _MovieListingHeaderState extends State<MovieListingHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 3),
      child: Column(
        children: [
          OptionsHeader(
            movieListingSection: widget.movieSection,
            isShowSearchMovie: widget.isShowSearchMovie,
            onChangeMovieListingSection: (movieSection) {
              widget.onChangeMovieListingSection(movieSection);
            },
            onChangeShowSearchMovie: (value) {
              widget.onChangeShowSearchMovie(value);
            },
          ),
          OptionsViewHeader(
            isShowSearchMovie: widget.isShowSearchMovie,
            onChangeShowSearchMovie: (value) {
              widget.onChangeShowSearchMovie(value);
            },
          ),
        ],
      ),
    );
  }
}

class OptionsViewHeader extends StatelessWidget {
  const OptionsViewHeader({
    super.key,
    required this.isShowSearchMovie,
    required this.onChangeShowSearchMovie,
  });

  final bool isShowSearchMovie;
  final OnChangeShowSearchMovie onChangeShowSearchMovie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      color: Colors.red,
      child: Column(
        children: [
          if (isShowSearchMovie)
            SearchMovieTextField(
              onChangeShowSearchMovie: (value) {
                onChangeShowSearchMovie(value);
              },
            ),
          Container(
            padding: const EdgeInsets.only(top: 6),
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
          ),
        ],
      ),
    );
  }
}

class SearchMovieTextField extends StatelessWidget {
  const SearchMovieTextField({
    super.key,
    required this.onChangeShowSearchMovie,
  });

  final OnChangeShowSearchMovie onChangeShowSearchMovie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20, left: 20),
      height: 25,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 0,
                ),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onChangeShowSearchMovie(false);
            },
            child: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class OptionsHeader extends StatelessWidget {
  const OptionsHeader({
    super.key,
    required this.onChangeMovieListingSection,
    required this.movieListingSection,
    required this.onChangeShowSearchMovie,
    required this.isShowSearchMovie,
  });

  final OnChangeMovieListingSection onChangeMovieListingSection;
  final MovieListingSection movieListingSection;
  final OnChangeShowSearchMovie onChangeShowSearchMovie;
  final bool isShowSearchMovie;

  @override
  Widget build(BuildContext context) {
    final isPlayingSection = movieListingSection == MovieListingSection.playing;
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
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    onChangeMovieListingSection(MovieListingSection.playing);
                  },
                  child: Text(
                    'Playing',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: isPlayingSection
                          ? Colors.black
                          : Colors.grey.shade400,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    onChangeMovieListingSection(MovieListingSection.upcoming);
                  },
                  child: Text(
                    'Upcoming',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: !isPlayingSection
                          ? Colors.black
                          : Colors.grey.shade400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              final show = !isShowSearchMovie;
              onChangeShowSearchMovie(show);
            },
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Icon(
              isShowSearchMovie ? Icons.close : Icons.search,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
