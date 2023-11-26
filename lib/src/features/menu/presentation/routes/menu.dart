import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuRoute extends StatefulWidget {
  const MenuRoute({super.key});

  static const routeName = 'menu';
  static const routePath = '/menu';

  @override
  State<MenuRoute> createState() => _MenuRouteState();
}

class _MenuRouteState extends State<MenuRoute> {
  List<MenuItem> mainMenuItem = [
    MenuItem(title: 'Movie', icon: Icons.movie_filter_outlined),
    MenuItem(title: 'Cinema', icon: Icons.play_circle),
    MenuItem(title: 'F&B', icon: Icons.fastfood),
    MenuItem(title: 'Sports Hall', icon: Icons.sports_basketball),
  ];

  List<MenuItem> secondMenuItem = [
    MenuItem(title: 'Rent', icon: Icons.supervised_user_circle),
    MenuItem(title: 'Promotions', icon: Icons.discount),
    MenuItem(title: 'News', icon: Icons.newspaper),
    MenuItem(title: 'Facitilies', icon: Icons.sports),
    MenuItem(title: 'Partnership', icon: Icons.handshake),
    MenuItem(title: 'Cistomer Center', icon: Icons.headset_mic),
    MenuItem(title: 'Membership', icon: Icons.money),
  ];

  List<SocialMedia> socialMedia = [
    SocialMedia(
        svgPath: 'assets/svg/facebook.svg',
        url: 'https://m.facebook.com/CGV.ID'),
    SocialMedia(
        svgPath: 'assets/svg/instagram.svg',
        url: 'https://www.instagram.com/CGV.ID/'),
    SocialMedia(
        svgPath: 'assets/svg/twitter.svg', url: 'https://twitter.com/CGV_ID'),
    SocialMedia(
        svgPath: 'assets/svg/youtube.svg',
        url: 'https://www.youtube.com/@CGVKreasi'),
    SocialMedia(
        svgPath: 'assets/svg/tiktok.svg',
        url: 'https://www.tiktok.com/@cgv.id'),
  ];

  Future<void> pushUrlLaucher(String url) async {
    try {
      final Uri fallbackUri = Uri.parse(url);
      await launchUrl(fallbackUri, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('cannot lauch');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MainMenu(mainMenuItem: mainMenuItem),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            color: Colors.black54,
          ),
        ),
        OptionsMenu(secondMenuItem: secondMenuItem),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'FOLLOW US',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (final item in socialMedia)
                      InkWell(
                        onTap: () {
                          pushUrlLaucher(item.url);
                        },
                        child: SizedBox(
                          width: 45,
                          height: 45,
                          child: SvgPicture.asset(
                            item.svgPath,
                            semanticsLabel: 'Acme Logo',
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OptionsMenu extends StatelessWidget {
  const OptionsMenu({
    super.key,
    required this.secondMenuItem,
  });

  final List<MenuItem> secondMenuItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 20, horizontal: 20),
      child: Wrap(
        runSpacing: 20,
        spacing: 5.0,
        children: [
          for (final item in secondMenuItem)
            InkWell(
              onTap: () {},
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.44,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                      child: Icon(
                        item.icon,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 14,
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

class MainMenu extends StatelessWidget {
  const MainMenu({
    super.key,
    required this.mainMenuItem,
  });

  final List<MenuItem> mainMenuItem;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(45),
              bottomRight: Radius.circular(45),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (final item in mainMenuItem)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 2,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Icon(
                        item.icon,
                        size: 35,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class SocialMedia {
  SocialMedia({
    required this.svgPath,
    required this.url,
  });
  final String svgPath;
  final String url;
}

class MenuItem {
  MenuItem({
    required this.title,
    required this.icon,
  });
  final String title;
  final IconData icon;
}
