import 'package:flutter/material.dart';

enum Variant { primary, sencondary }

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
    this.variant = Variant.primary,
  });

  final Variant variant;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final variant = widget.variant;
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 40, bottom: 25),
      width: double.infinity,
      color: variant == Variant.sencondary ? Colors.white : Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                ),
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Search Movie ....',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.grey.shade400,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.transparent,
                  border: Border.all(
                    width: 2,
                    color: variant == Variant.sencondary
                        ? Colors.pink
                        : Colors.white,
                  ),
                ),
                child: Icon(
                  Icons.person_2_outlined,
                  size: 20,
                  color: variant == Variant.sencondary
                      ? Colors.pink
                      : Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                width: 25,
                child: Icon(
                  Icons.email_outlined,
                  color: variant == Variant.sencondary
                      ? Colors.pink
                      : Colors.white,
                  size: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
