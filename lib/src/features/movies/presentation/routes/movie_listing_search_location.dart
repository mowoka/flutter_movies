import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_moka/src/features/movies/presentation/providers/movie_listing_provider.dart';
import 'package:movie_moka/src/features/movies/presentation/widget/search_location_header.dart';
import 'package:provider/provider.dart';

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

  List<String> putCurrentLocationToFirstList(String currentLocation) {
    List<String> tempLocation =
        locations.where((element) => element != currentLocation).toList();
    tempLocation.insert(0, currentLocation);
    return tempLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<MovieListingProvider>(
          builder: (context, notifier, child) {
            final customLocation = putCurrentLocationToFirstList(
              notifier.location,
            );

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SearchLocationHeader(),
                  const SearchWidget(),
                  const SizedBox(height: 5),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 10, right: 10),
                      child: ListView.separated(
                        itemCount: customLocation.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              notifier.updateLocation(customLocation[index]);
                              GoRouter.of(context).pop();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        customLocation[index],
                                        style: TextStyle(
                                          color: index == 0
                                              ? Colors.red
                                              : Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      if (index == 0) ...[
                                        const SizedBox(width: 5),
                                        const Icon(
                                          Icons.circle,
                                          size: 5,
                                        ),
                                        const SizedBox(width: 5),
                                        const Text(
                                          "Current Location",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ]
                                    ],
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
            );
          },
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
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 2,
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
