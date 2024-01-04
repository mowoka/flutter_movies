import 'package:flutter/material.dart';
import 'package:movie_moka/src/core/utils/data/dummy_data.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie_listing_entity.dart';
import 'package:movie_moka/src/features/movies/presentation/providers/movie_listing_provider.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_home_now_playing.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_listing_playing.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_listing_upcoming.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MovieListingContent extends StatefulWidget {
  const MovieListingContent({
    super.key,
    required this.movieListShowType,
    required this.movieListingSection,
  });

  final MovieListShowType movieListShowType;
  final MovieListingSection movieListingSection;

  @override
  State<MovieListingContent> createState() => _MovieListingContentState();
}

class _MovieListingContentState extends State<MovieListingContent> {
  final List<MovieUI> movies = [
    MovieUI(
      title: 'Dilan',
      rating: 4.5,
      startDate: '2023-11-20',
      imageURL:
          'https://s2.bukalapak.com/img/7057854092/large/poster_film_dilan.jpeg',
      ages: '15+',
      types: ['Drama', 'Comedy'],
      duration: '120 min',
    ),
    MovieUI(
      title: "Matix: Croine a I'incroyable",
      rating: 3.5,
      startDate: '2023-11-22',
      imageURL:
          'https://www.originalfilmart.com/cdn/shop/products/the_matrix_1999_fr_original_film_art_a.jpg?v=1640646540',
      ages: '19+',
      types: ['Actions'],
      duration: '110 min',
    ),
    MovieUI(
      title: 'KADET 1947',
      rating: 4,
      startDate: '2023-11-21',
      imageURL:
          'https://asset.kompas.com/crops/7Ubrj5X59RzzppNgNDS6x6gBRrM=/31x9:872x1131/300x400/data/photo/2021/10/29/617b75cc70698.jpeg',
      ages: '17+',
      types: ['Actions', 'Comedy'],
      duration: '140 min',
    ),
    MovieUI(
      title: 'JOKER',
      rating: 5,
      startDate: '2023-11-25',
      imageURL:
          'https://asset.kompas.com/crop/39x0:1051x1349/300x400/data/photo/2019/04/03/2579847035.jpg',
      ages: '21+',
      types: ['Actions', 'Horror'],
      duration: '121 min',
    ),
    MovieUI(
      title: 'Bankit',
      rating: 4,
      startDate: '2023-11-15',
      imageURL:
          'https://assets.kompasiana.com/items/album/2016/07/30/poster-film-bangkit-cinemags-id-579c5a41d77a6127153c0385.jpg?t=o&v=300',
      ages: '16+',
      types: ['Drama'],
      duration: '98 min',
    ),
    MovieUI(
      title: 'AKAL',
      rating: 3.5,
      startDate: '2023-12-15',
      imageURL:
          'https://d10j0070m15qtm.cloudfront.net/uploads/4a8dd312-66cf-405e-bc05-e076f135d94c_thumbnail_portrait',
      ages: '21+',
      types: ['Actions', 'Horror'],
      duration: '121 min',
    ),
    MovieUI(
      title: 'AVATAR',
      rating: 5,
      startDate: '2023-12-15',
      imageURL:
          'https://www.originalfilmart.com/cdn/shop/products/Avatar_2009_french_original_film_art_a.jpg?v=1593823743',
      ages: '21+',
      types: ['Actions'],
      duration: '121 min',
    ),
    MovieUI(
      title: 'MAGIC',
      rating: 2,
      startDate: '2023-12-12',
      imageURL:
          'https://i.pinimg.com/474x/27/05/37/270537314a10cbea149beadaef75a07b.jpg',
      ages: '14+',
      types: ['Drama'],
      duration: '121 min',
    ),
    MovieUI(
      title: 'KITA NIKAH YUK!',
      rating: 4,
      startDate: '2023-12-17',
      imageURL:
          'https://i.pinimg.com/474x/82/71/81/8271817666e81e80e890353e45aee096.jpg',
      ages: '21+',
      types: ['Comedy'],
      duration: '121 min',
    ),
    MovieUI(
      title: 'RAJAWALI',
      rating: 3,
      startDate: '2023-12-20',
      imageURL:
          'https://i.pinimg.com/474x/58/9f/74/589f74486eda467ce0bec8914817c644.jpg',
      ages: '17+',
      types: ['Actions', 'Drama'],
      duration: '121 min',
    ),
    MovieUI(
      title: 'KUNGFU PANDA 2',
      rating: 5,
      startDate: '2023-12-21',
      imageURL:
          'https://i.pinimg.com/564x/b9/e0/9f/b9e09f9b934a294fee7bb00084d6f967.jpg',
      ages: '12+',
      types: ['Actions', 'Comedy', 'Cartoons'],
      duration: '121 min',
    ),
  ];

  final List<MovieUI> upcomingMovie = [
    MovieUI(
      title: 'Mangkujiwo',
      rating: 4,
      startDate: '2023-12-20',
      imageURL:
          'https://asset.kompas.com/crops/tiBQxUI8HsvJp7O7LG_wr8mzEEk=/0x3:1200x1603/300x400/data/photo/2020/01/30/5e3258344a374.jpg',
      ages: '15+',
      types: ['Horor'],
      duration: '120 min',
      totalFavorite: 80,
    ),
    MovieUI(
      title: 'Tiger 3',
      rating: 4,
      startDate: '2023-12-25',
      imageURL:
          'https://m.media-amazon.com/images/M/MV5BYzQwMGZlYTUtODUwNi00ZjQxLWEzODAtZGU3Zjc0MmNhMzhkXkEyXkFqcGdeQXVyNTkzNDQ4ODc@._V1_.jpg',
      ages: '15+',
      types: ['Action'],
      duration: '120 min',
      totalFavorite: 20,
    ),
    MovieUI(
      title: 'Avatar 3: The Way of Water',
      rating: 5,
      startDate: '2023-12-25',
      imageURL:
          'https://www.puriindahmall.co.id/assets/img/news/1670915741_77_0_avatar.jpg',
      ages: '15+',
      types: ['Action', 'Drama'],
      duration: '120 min',
      totalFavorite: 120,
    ),
    MovieUI(
      title: 'Anugrah Cinta',
      rating: 3,
      startDate: '2023-12-12',
      imageURL:
          'https://i.pinimg.com/474x/62/4a/70/624a704467f273c54e98c9619cfad6b8.jpg',
      ages: '15+',
      types: ['Drama', 'Romance'],
      duration: '120 min',
      totalFavorite: 12,
    ),
    MovieUI(
      title: 'Le Grand Voyage',
      rating: 2,
      startDate: '2023-12-10',
      imageURL:
          'https://assets-a1.kompasiana.com/items/album/2022/04/20/grand-voyage-625f5789bb448605d813b909.jpg',
      ages: '15+',
      types: [
        'Drama',
      ],
      duration: '122 min',
      totalFavorite: 2,
    ),
    MovieUI(
      title: 'DOGMAN',
      rating: 4,
      startDate: '2023-12-15',
      imageURL: 'https://i.ebayimg.com/images/g/S68AAOSwXOxlEDlb/s-l400.jpg',
      ages: '12+',
      types: [
        'Drama',
      ],
      duration: '122 min',
      totalFavorite: 15,
    ),
    MovieUI(
      title: 'Teen Beach',
      rating: 4,
      startDate: '2023-12-22',
      imageURL:
          'https://upload.wikimedia.org/wikipedia/id/0/06/Teen_Beach_Movie_poster.jpg',
      ages: '12+',
      types: ['Drama', 'Romance', 'School'],
      duration: '122 min',
      totalFavorite: 60,
    ),
    MovieUI(
      title: 'GATEWAY',
      rating: 4,
      startDate: '2023-12-29',
      imageURL:
          'https://www.originalfilmart.com/cdn/shop/products/the_getaway_1972_french_original_film_art_a_85f9db78-88bd-4ba7-b504-4e0806dfe0d5.jpg?v=1638491543',
      ages: '12+',
      types: ['Drama', 'Action'],
      duration: '111 min',
      totalFavorite: 72,
    ),
    MovieUI(
      title: 'Lukisan Awan',
      rating: 5,
      startDate: '2023-12-24',
      imageURL:
          'https://deepublishstore.com/wp-content/uploads/2019/01/Lukisan-Awan-Marjiyati-Convert-depan-300x400.jpg',
      ages: '12+',
      types: ['Drama', 'Comedy', 'Friendly'],
      duration: '111 min',
      totalFavorite: 120,
    ),
    MovieUI(
      title: 'ALI',
      rating: 5,
      startDate: '2023-12-26',
      imageURL:
          'https://cdn.filmfestivalflix.com/wp-content/fff-uploads-bucket/2023/10/Ali-vs-Ali_Portrait-Poster-300x400.jpg',
      ages: '12+',
      types: ['Drama'],
      duration: '111 min',
      totalFavorite: 90,
    ),
    MovieUI(
      title: 'Matilda',
      rating: 4,
      startDate: '2023-12-26',
      imageURL:
          'https://www.musicshopeurope.com/product/image/medium/hl01154542_0.jpg',
      ages: '12+',
      types: ['Drama'],
      duration: '111 min',
      totalFavorite: 2,
    ),
  ];

  Future<List<Movie>> _getMoviePlaying() async {
    final provider = Provider.of<MovieListingProvider>(context, listen: false);
    return await provider.getMoviePlaying();
  }

  @override
  Widget build(BuildContext context) {
    final sectionPlaying =
        widget.movieListingSection == MovieListingSection.playing;

    if (sectionPlaying) {
      return FutureBuilder<List<Movie>>(
          future: _getMoviePlaying(),
          builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Skeletonizer(
                enabled: true,
                child: MovieListingPlaying(
                  movieListShowType: widget.movieListShowType,
                  movies: dummyMovies,
                  isLoading:
                      snapshot.connectionState == ConnectionState.waiting,
                ),
              );
            }
            if (snapshot.data == null) {
              return Container();
            }
            return MovieListingPlaying(
              movieListShowType: widget.movieListShowType,
              movies: snapshot.data!,
            );
          });
    }
    return MovieListingUpcoming(
      movieListShowType: widget.movieListShowType,
      upcomingMovies: upcomingMovie,
    );
  }
}
