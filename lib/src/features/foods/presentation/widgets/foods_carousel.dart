import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class FoodsCarousel extends StatefulWidget {
  const FoodsCarousel({super.key});

  @override
  State<FoodsCarousel> createState() => _FoodsCarouselState();
}

class _FoodsCarouselState extends State<FoodsCarousel> {
  int currentIndex = 0;
  List<String> foodBanners = [
    'https://www.silverkey.org/wp-content/uploads/2022/09/BB-Images-820-x-312-px-1.png',
    'https://dining.uconn.edu/wp-content/uploads/sites/125/2023/10/web_BakeryMarketplace-820-x-312-px.png',
    'https://i0.wp.com/peppertt.com/wp-content/uploads/2020/06/19010-LINDAS-820x312-FB-Cover.jpg?fit=820%2C312&ssl=1',
    'https://www.maksubeauty.com/image/maksubeauty/image/cache/data/all_product_images/product-1744/eno-820x312.png',
    'https://beerasia.net/wp-content/uploads/2019/07/1.-BEER-ASIA-FB-COVER-820X312-.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 820 / 312,
                autoPlayInterval: const Duration(seconds: 2),
                disableCenter: false,
                viewportFraction: 1,
                enlargeCenterPage: true,
                padEnds: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                }),
            items: foodBanners.map<Widget>((i) {
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
          Container(
            padding: const EdgeInsets.only(top: 10),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DotsIndicator(
                  dotsCount: foodBanners.length,
                  position: currentIndex.toDouble(),
                  decorator: DotsDecorator(
                    spacing: const EdgeInsets.symmetric(horizontal: 3),
                    color: Colors.grey.shade300,
                    activeColor: Colors.pink.shade600,
                    size: const Size.square(8.0),
                    activeSize: const Size(20.0, 8.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
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
