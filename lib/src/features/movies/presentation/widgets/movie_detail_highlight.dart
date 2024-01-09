import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie_detail_entity.dart';

class MovieDetailHighlight extends StatefulWidget {
  const MovieDetailHighlight({
    super.key,
    required this.movieDetail,
  });

  final MovieDetailEntity movieDetail;

  @override
  State<MovieDetailHighlight> createState() => _MovieDetailHighlightState();
}

class _MovieDetailHighlightState extends State<MovieDetailHighlight> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 490,
      width: double.infinity,
      child: Stack(
        children: [
          MovieHighlightImageCover(
            movieImageURL: widget.movieDetail.imageURL,
          ),
          Positioned(
            top: 200,
            child: MovieHighlightTitle(
              movieImageURL: widget.movieDetail.imageURL,
              title: widget.movieDetail.title,
              types: widget.movieDetail.types,
              ages: widget.movieDetail.ages,
              duration: widget.movieDetail.duration,
            ),
          ),
          Positioned(
            bottom: 10,
            right: 0,
            left: 0,
            child: Container(
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.shade200,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MovieHightlightInfo(
                      icon: Icons.favorite_border,
                      colorIcon: Colors.grey.shade500,
                      title: 'WATCHLIST',
                      subPrimaryText:
                          widget.movieDetail.totalWatchlist.toString(),
                      subSecondaryText: 'TIMES',
                    ),
                    MovieHightlightInfo(
                      icon: Icons.star_outlined,
                      colorIcon: Colors.amber.shade400,
                      title: 'REVIEW',
                      subPrimaryText: widget.movieDetail.rating.toString(),
                      subSecondaryText:
                          '${widget.movieDetail.totalReviewer} review',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MovieHightlightInfo extends StatelessWidget {
  const MovieHightlightInfo({
    super.key,
    required this.icon,
    required this.colorIcon,
    required this.title,
    required this.subPrimaryText,
    required this.subSecondaryText,
  });

  final IconData icon;
  final Color colorIcon;
  final String title;
  final String subPrimaryText;
  final String subSecondaryText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: colorIcon,
            size: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      subPrimaryText,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      subSecondaryText,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MovieHighlightTitle extends StatelessWidget {
  const MovieHighlightTitle({
    super.key,
    required this.movieImageURL,
    required this.title,
    required this.types,
    required this.ages,
    required this.duration,
  });

  final String movieImageURL;
  final String title;
  final List<String> types;
  final String duration;
  final String ages;

  @override
  Widget build(BuildContext context) {
    final movieType = types.join(',');
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                image: NetworkImage(
                  movieImageURL,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '$movieType ~ $duration ~$ages',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MovieHighlightImageCover extends StatelessWidget {
  const MovieHighlightImageCover({
    super.key,
    required this.movieImageURL,
  });

  final String movieImageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            movieImageURL,
          ),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: const Icon(
            Icons.play_arrow,
            color: Colors.pink,
            size: 30,
          ),
        ),
      ),
    );
  }
}
