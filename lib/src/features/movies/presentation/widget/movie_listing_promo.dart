import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/movies/presentation/widget/movie_listing_header.dart';

class MovieListingPromo extends StatefulWidget {
  const MovieListingPromo({super.key});

  @override
  State<MovieListingPromo> createState() => _MovieListingPromoState();
}

class _MovieListingPromoState extends State<MovieListingPromo> {
  List<String> promoMovies = [
    'https://www.gourmetads.com/wp-content/uploads/2019/02/970x250-starbucks-nitro.jpg',
    'https://www.gourmetads.com/wp-content/uploads/2019/02/970x250-starbucks.jpg',
    'https://www.healthyads.com/wp-content/uploads/2020/04/970x250-billboard.jpg',
    'https://adspecs.yahooinc.com/_next/image?url=https%3A%2F%2Fs.yimg.com%2Fcv%2Fapiv2%2Fadspecs%2Ffeature%2FdesignRequirementAssets%2F769%2F970x250-static_1659029428813.jpg&w=3840&q=75'
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
