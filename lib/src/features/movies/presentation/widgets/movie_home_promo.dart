import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_home_header.dart';

class MovieHomePromo extends StatefulWidget {
  const MovieHomePromo({super.key});

  @override
  State<MovieHomePromo> createState() => _MovieHomePromoState();
}

class _MovieHomePromoState extends State<MovieHomePromo> {
  List<String> promoMovies = [
    'promo_offer_01.jpeg',
    'promo_offer_02.jpeg',
    'promo_offer_03.jpeg',
    'promo_offer_04.webp',
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
              MovieHomeHeader(
                title: "What's On",
                subTitle: "Exclusive offers and highlights!",
                onTap: () {},
              ),
              const SizedBox(height: 5),
              for (final promo in promoMovies)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('assets/offers/$promo'),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        const Divider(
          color: Colors.black45,
        ),
      ],
    );
  }
}
