import 'package:accordion/accordion_section.dart';
import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie_detail_entity.dart';

typedef OnChangeAccordion = Function(bool value);

class MovieDetailCiname extends StatefulWidget {
  const MovieDetailCiname({
    super.key,
    required this.movieCinema,
    required this.isAccordionOpen,
    required this.onChangeAccordion,
  });

  final MovieCinema movieCinema;
  final bool isAccordionOpen;
  final OnChangeAccordion onChangeAccordion;

  @override
  State<MovieDetailCiname> createState() => _MovieDetailCinameState();
}

class _MovieDetailCinameState extends State<MovieDetailCiname> {
  @override
  Widget build(BuildContext context) {
    final movieCinema = widget.movieCinema;

    return AccordionSection(
      isOpen: widget.isAccordionOpen,
      onCloseSection: () {
        widget.onChangeAccordion(false);
      },
      onOpenSection: () {
        widget.onChangeAccordion(true);
      },
      // rightIcon: const Icon(Icons.keyboard_arrow_down),
      headerBackgroundColor: Colors.white,
      headerBackgroundColorOpened: Colors.white,
      headerBorderRadius: 0,
      headerBorderWidth: 5,
      headerPadding: const EdgeInsets.symmetric(horizontal: 15),
      header: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ALL CINEMAS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade500,
                ),
              ),
              Icon(
                widget.isAccordionOpen
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
              )
            ],
          ),
          const Divider(),
        ],
      ),
      contentBorderColor: Colors.white,
      contentBackgroundColor: Colors.white,
      contentHorizontalPadding: 15,
      contentVerticalPadding: 0,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        height: 450,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    movieCinema.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Text(
                          '${movieCinema.distance} km away',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            for (final item in movieCinema.cinemaType)
              MovieScheduleItem(movieCinemaType: item),
          ],
        ),
      ),
    );
  }
}

class MovieScheduleItem extends StatelessWidget {
  const MovieScheduleItem({
    super.key,
    required this.movieCinemaType,
  });

  final MovieCinemaType movieCinemaType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Text(
                      movieCinemaType.type,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'From Rp${movieCinemaType.price}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                movieCinemaType.seatName,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 40,
          child: ListView.builder(
            itemCount: movieCinemaType.movieSchedule.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container();
            },
          ),
        ),
      ],
    );
  }
}
