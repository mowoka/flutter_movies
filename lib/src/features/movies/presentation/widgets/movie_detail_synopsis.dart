import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_ink_well.dart';

class MovieDetailSynopsis extends StatefulWidget {
  const MovieDetailSynopsis({super.key});

  @override
  State<MovieDetailSynopsis> createState() => _MovieDetailSynopsisState();
}

class _MovieDetailSynopsisState extends State<MovieDetailSynopsis> {
  bool isHideSynopsis = true;

  String htmlData = """<div>
    <p>Dom Toretto and his family have faced numerous challenges and overcome impossible obstacles on their journeys. Now, they confront their deadliest foe yet: a terrifying threat from Dom's shadowy past, driven by bloody vengeance and determined to destroy the family and everything Dom holds dear.</p>

    <span>In the 2011 film "Fast Five," Dom and his crew defeated the wicked Brazilian drug lord Hernan Reyes, dismantling his empire on a bridge in Rio De Janeiro. Unbeknownst to them, Reyes' son, Dante, witnessed it all and spent the last 12 years plotting to make Dom pay the highest price.</span>

    <span>Dante's plan unfolds, scattering Dom's family from Los Angeles to the catacombs of Rome, from Brazil to London, and from Portugal to Antarctica. New allies will be forged, and old enemies will resurface.</span>

    <span>However, everything takes a turn when Dom discovers that his own 8-year-old son is Dante's primary target for revenge.</span>

    <ul style="margin-left: -35px">
      <li>James Wan as Director</li>
      <li>Jason Momoa as Starring</li>
      <li>Amber Heard as Starring</li>
      <li>Patrict Wilson as Starring</li>
    </ul>

  </div>""";

  @override
  Widget build(BuildContext context) {
    Widget html = Html(
      data: htmlData,
      style: {
        "p": isHideSynopsis
            ? Style(
                color: Colors.grey.shade600,
                textOverflow: TextOverflow.ellipsis,
                maxLines: 3,
              )
            : Style(
                color: Colors.grey.shade600,
              ),
        "span": Style(
          color: Colors.grey.shade600,
        ),
        "li": Style(
          color: Colors.grey.shade600,
          fontWeight: FontWeight.w600,
        )
      },
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'SYNOPSIS',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade500,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: isHideSynopsis ? 55 : 330,
            child: html,
          ),
          MokaInkWell(
            onTap: () {
              setState(() {
                isHideSynopsis = !isHideSynopsis;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                isHideSynopsis ? 'READ MORE' : 'READ LESS',
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
