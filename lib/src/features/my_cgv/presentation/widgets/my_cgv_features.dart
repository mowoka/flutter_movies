import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_moka/src/features/auth/presentation/routes/login.dart';

class MyCgvFeatures extends StatefulWidget {
  const MyCgvFeatures({super.key});

  @override
  State<MyCgvFeatures> createState() => _MyCgvFeaturesState();
}

class _MyCgvFeaturesState extends State<MyCgvFeatures> {
  List<MyCgvFeatureMenu> myCgvFeatureMenu = [
    MyCgvFeatureMenu(title: 'Transaction History', icon: Icons.history_edu),
    MyCgvFeatureMenu(title: 'Movie Story', icon: Icons.wechat),
    MyCgvFeatureMenu(title: 'Watchlist', icon: Icons.movie_filter),
    MyCgvFeatureMenu(title: 'Favorite', icon: Icons.favorite),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'MY FEATURES',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (final item in myCgvFeatureMenu)
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      GoRouter.of(context).pushNamed(Login.routeName);
                    },
                    child: SizedBox(
                      width: 65,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                width: 1,
                                color: Colors.grey.shade200,
                              ),
                            ),
                            child: Icon(
                              item.icon,
                              size: 30,
                              color: Colors.pink,
                            ),
                          ),
                          const SizedBox(height: 10),
                          FeatureMenuTitle(
                            title: item.title,
                          ),
                        ],
                      ),
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

class FeatureMenuTitle extends StatelessWidget {
  const FeatureMenuTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final textlist = title.split(' ');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (final item in textlist) Text(item),
      ],
    );
  }
}

class MyCgvFeatureMenu {
  MyCgvFeatureMenu({
    required this.title,
    required this.icon,
  });
  final String title;
  final IconData icon;
}
