import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/movies/presentation/widget/search_location_header.dart';

class MovieListingSearchLocation extends StatefulWidget {
  const MovieListingSearchLocation({super.key});

  static const routeName = 'movie listing search location';
  static const routePath = 'movie-search-location';

  @override
  State<MovieListingSearchLocation> createState() =>
      _MovieListingSearchLocationState();
}

class _MovieListingSearchLocationState
    extends State<MovieListingSearchLocation> {
  List<String> locations = [
    'Medan',
    'Padang',
    'Pekanbaru',
    'Batam',
    'Palembang',
    'Lampung',
    'Serang',
    'Tangerang',
    'Tangerang City',
    'Tangerang Selatan',
    'Jakarta',
    'Depok',
    'Bogor',
    'Bekasi',
    'Cikarang',
    'Karawang',
    'Purwakarta',
    'Bandung',
    'Cimahi',
    'Cirebon',
    'Tegal'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SearchLocationHeader(),
              const SearchWidget(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ListView.separated(
                    itemCount: locations.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                locations[index],
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.grey.shade500,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SizedBox(
              width: 20,
              child: Icon(
                Icons.search,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Search',
              ),
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
