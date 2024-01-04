import 'package:accordion/accordion_section.dart';
import 'package:flutter/material.dart';
import 'package:movie_moka/src/core/presentation/provider/location_provider.dart';
import 'package:provider/provider.dart';

class FoodsPlaceList extends StatefulWidget {
  const FoodsPlaceList({super.key});

  @override
  State<FoodsPlaceList> createState() => _FoodsPlaceListState();
}

class _FoodsPlaceListState extends State<FoodsPlaceList> {
  bool _isAccordionOpen = true;

  List<String> foodCinemaList = [
    '23 Paskal Shooping Center',
    'BEC MALL',
    'Kings Shopping Center',
    'Metro Indah Mall',
    'Miko Mall',
    'Paris Van Java'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const FoodLocation(),
          AccordionSection(
            isOpen: _isAccordionOpen,
            rightIcon: const Icon(Icons.keyboard_arrow_down),
            onCloseSection: () {
              setState(() {
                _isAccordionOpen = false;
              });
            },
            onOpenSection: () {
              setState(() {
                _isAccordionOpen = true;
              });
            },
            headerBackgroundColor: Colors.grey.shade300,
            headerBackgroundColorOpened: Colors.grey.shade300,
            headerBorderRadius: 0,
            headerBorderWidth: 10,
            contentBorderColor: Colors.white,
            contentVerticalPadding: 0,
            contentHorizontalPadding: 0,
            contentBorderRadius: 0,
            header: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'ALL CINEMAS',
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),
            ),
            content: Container(
              height: 450,
              color: Colors.white,
              child: ListView.separated(
                itemCount: foodCinemaList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        left: 20,
                        bottom: 6,
                        top: 6,
                        right: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.food_bank,
                                  color: Colors.pink,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  foodCinemaList[index],
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_right,
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Padding(
                  padding: EdgeInsets.only(left: 20, right: 10),
                  child: Divider(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FoodLocation extends StatelessWidget {
  const FoodLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(
      builder: (context, notifier, child) {
        return Container(
          padding:
              const EdgeInsets.only(left: 20, right: 10, top: 15, bottom: 15),
          color: Colors.red.shade500,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    notifier.location,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'CHANGE',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
