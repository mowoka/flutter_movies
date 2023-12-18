import 'package:flutter/material.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_ink_well.dart';
import 'package:movie_moka/src/features/movies/domain/entities/movie_detail_entity.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_detail_cinema.dart';
import 'package:movie_moka/src/features/movies/presentation/widgets/movie_detail_filter_seat_option.dart';

class MovieDetailSeatType extends StatefulWidget {
  const MovieDetailSeatType({super.key});

  @override
  State<MovieDetailSeatType> createState() => _MovieDetailSeatTypeState();
}

class _MovieDetailSeatTypeState extends State<MovieDetailSeatType> {
  bool _isAccordionOpen = true;
  final movieCinema = MovieCinema();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const MovieDetailSeatTypeTitle(),
          const SizedBox(height: 10),
          MovieDetailCinema(
            movieCinema: movieCinema,
            isAccordionOpen: _isAccordionOpen,
            onChangeAccordion: (value) {
              setState(() {
                _isAccordionOpen = value;
              });
            },
          )
        ],
      ),
    );
  }
}

class MovieDetailSeatTypeTitle extends StatelessWidget {
  const MovieDetailSeatTypeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              'RECOMMENDED CINEMA',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade500,
              ),
            ),
          ),
          MokaInkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                isScrollControlled: true,
                constraints: const BoxConstraints(
                  maxHeight: 200,
                ),
                builder: (BuildContext context) {
                  return const MovieDetailFilterSeatOption();
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.only(left: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.filter_list,
                    color: Colors.black,
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'FILTER',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
