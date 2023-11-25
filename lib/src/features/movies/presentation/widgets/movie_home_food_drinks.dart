import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_home_header.dart';

class MovieHomeFoodAndDrinks extends StatefulWidget {
  const MovieHomeFoodAndDrinks({super.key});

  @override
  State<MovieHomeFoodAndDrinks> createState() => _MovieHomeFoodAndDrinksState();
}

class _MovieHomeFoodAndDrinksState extends State<MovieHomeFoodAndDrinks> {
  List<String> foodPromo = [
    'https://img.freepik.com/premium-vector/special-discount-food-banner-design_291930-521.jpg'
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
              const MovieHomeHeader(
                title: 'Food & Drinks',
                subTitle: 'To complete your movie experience!',
                showButton: false,
              ),
              for (final promo in foodPromo)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      promo,
                    ),
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
