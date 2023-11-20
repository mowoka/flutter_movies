import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/foods/presentation/widgets/foods_carousel.dart';
import 'package:movie_moka/src/features/foods/presentation/widgets/foods_place_list.dart';

class Foods extends StatefulWidget {
  const Foods({super.key});

  static const routeName = 'foods';
  static const routePath = '/foods';

  @override
  State<Foods> createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          FoodsCarousel(),
          FoodsPlaceList(),
        ],
      ),
    );
  }
}
