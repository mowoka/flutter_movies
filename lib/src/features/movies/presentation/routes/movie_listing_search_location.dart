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

  List<String> customizeLocations(
    String currentLocation,
    String searchKeyword,
  ) {
    List<String> tempLocation =
        locations.where((element) => element != currentLocation).toList();
    // to set current location on top array
    tempLocation.insert(0, currentLocation);
    if (searchKeyword.isEmpty) return tempLocation;
    // to filter search keyword
    final filterLocation = tempLocation
        .where((element) =>
            element.toLowerCase().contains(searchKeyword.toLowerCase()))
        .toList();
    return filterLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<MovieListingProvider>(
          builder: (context, notifier, child) {
            final customLocation = customizeLocations(
              notifier.location,
              notifier.locationSearchKeyword,
            );

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SearchLocationHeader(),
                  SearchWidget(
                    searchKeyword: notifier.locationSearchKeyword,
                    onChangeSearch: (value) {
                      notifier.updateLocationSearchKeyword(value);
                    },
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 10, right: 10),
                      child: ListView.separated(
                        itemCount: customLocation.length,
                        itemBuilder: (BuildContext context, int index) {
                          final isCurrentLocation =
                              customLocation[index] == notifier.location;
                          return InkWell(
                            onTap: () {
                              notifier.updateLocation(customLocation[index]);
                              notifier.resetLocationSearchKeyword();
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
                                          color: isCurrentLocation
                                              ? Colors.red
                                              : Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      if (isCurrentLocation) ...[
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

typedef OnChangeSearch = Function(String value);

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.searchKeyword,
    required this.onChangeSearch,
  });
  final String searchKeyword;
  final OnChangeSearch onChangeSearch;

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
              initialValue: searchKeyword,
              onChanged: (value) {
                onChangeSearch(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
