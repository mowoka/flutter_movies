import 'package:accordion/accordion_section.dart';
import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie_detail_entity.dart';

typedef OnChangeAccordion = Function(bool value);

class MovieDetailCinema extends StatefulWidget {
  const MovieDetailCinema({
    super.key,
    required this.movieCinema,
    required this.isAccordionOpen,
    required this.onChangeAccordion,
  });

  final MovieCinema movieCinema;
  final bool isAccordionOpen;
  final OnChangeAccordion onChangeAccordion;

  @override
  State<MovieDetailCinema> createState() => _MovieDetailCinemaState();
}

class _MovieDetailCinemaState extends State<MovieDetailCinema> {
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
      contentHorizontalPadding: 0,
      contentVerticalPadding: 0,
      content: Container(
        height: movieCinema.cinemaType.length * 140,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
        Container(
          padding: const EdgeInsets.only(bottom: 10, top: 20),
          width: double.infinity,
          child: Container(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
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
        ),
        SizedBox(
          width: double.infinity,
          height: 70,
          child: ListView.builder(
            itemCount: movieCinemaType.movieSchedule.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              final schedule = movieCinemaType.movieSchedule[index];

              return ScheduleItem(
                index: index,
                schedule: schedule,
              );
            },
          ),
        ),
      ],
    );
  }
}

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({
    super.key,
    required this.index,
    required this.schedule,
  });

  final int index;
  final MovieCinemaSchedule schedule;

  @override
  Widget build(BuildContext context) {
    double marginLeftValue = 10 + (index == 0 ? 10 : 0);
    return Container(
      margin: EdgeInsets.only(left: marginLeftValue, right: 10),
      height: 40,
      width: 140,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  schedule.startTime,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '  -  ${schedule.endTime}',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  schedule.availableSeat.toString(),
                  style: TextStyle(
                    color: Colors.green.shade400,
                  ),
                ),
                Text(
                  '/${schedule.totalSeat} Seat',
                  style: TextStyle(
                    color: Colors.grey.shade500,
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
