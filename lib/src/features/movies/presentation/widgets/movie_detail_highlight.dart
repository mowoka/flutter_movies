import 'package:flutter/material.dart';

class MovieDetailHighlight extends StatefulWidget {
  const MovieDetailHighlight({super.key});

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
          const MovieHighlightImageCover(),
          const Positioned(
            top: 200,
            child: MovieHighlightTitle(),
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
                      subPrimaryText: '795+',
                      subSecondaryText: 'TIMES',
                    ),
                    MovieHightlightInfo(
                      icon: Icons.star_outlined,
                      colorIcon: Colors.amber.shade400,
                      title: 'REVIEW',
                      subPrimaryText: '5',
                      subSecondaryText: '104 review',
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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            height: 140,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                image: NetworkImage(
                  'https://s2.bukalapak.com/img/7057854092/large/poster_film_dilan.jpeg',
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
                const Text(
                  'DILAN',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'DRAMA ~ 103 mins ~ 13+',
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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://s2.bukalapak.com/img/7057854092/large/poster_film_dilan.jpeg',
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
