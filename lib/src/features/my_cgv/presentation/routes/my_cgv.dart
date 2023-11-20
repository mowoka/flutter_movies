import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/my_cgv/presentation/widgets/my_cgv_features.dart';

class MyCgv extends StatefulWidget {
  const MyCgv({super.key});

  static const routeName = 'my cgv';
  static const routePath = '/my-cgv';

  @override
  State<MyCgv> createState() => _MyCgvState();
}

class _MyCgvState extends State<MyCgv> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const MyCgvFeatures(),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Divider(
              color: Colors.grey.shade200,
              thickness: 5,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'OTHER',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                OtherMenu(
                  title: 'Costumer Center',
                  subTitle: 'Find the best answer to your questions',
                  icon: Icons.headset_mic_outlined,
                ),
                OtherMenu(
                  title: 'Settings',
                  subTitle: 'View and set your accounts preferences',
                  icon: Icons.settings,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OtherMenu extends StatelessWidget {
  const OtherMenu({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });

  final String title;
  final String subTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          icon,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            subTitle,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey.shade400,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
