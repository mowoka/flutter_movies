import 'package:flutter/material.dart';

typedef OnTap = void Function();

class MovieListingHeader extends StatelessWidget {
  const MovieListingHeader({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  final String title;
  final String subTitle;
  final OnTap onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subTitle,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black38,
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: onTap,
            child: const Row(children: [
              Text(
                'VIEW ALL',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.red,
                size: 30,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
