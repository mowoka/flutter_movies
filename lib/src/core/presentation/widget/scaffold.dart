import 'package:flutter/material.dart';
import 'package:movie_moka/src/core/presentation/provider/bottom_menu_provider.dart';
import 'package:movie_moka/src/core/presentation/widget/app_bar.dart';
import 'package:movie_moka/src/core/presentation/widget/bottom_navigation.dart';
import 'package:movie_moka/src/features/menu/presentation/routes/menu.dart';
import 'package:movie_moka/src/features/movies/presentation/routes/movie_listing.dart';
import 'package:provider/provider.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({
    super.key,
    required this.children,
    required this.routeName,
  });

  final Widget children;
  final String routeName;

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomAppBar(),
            Expanded(
              child: Consumer<BottomMenuProvier>(
                builder: (context, notifier, child) {
                  switch (notifier.activeMenuIndex) {
                    case 0:
                      return const MovieListing();
                    case 1:
                      return const MovieListing();
                    case 2:
                      return const MovieListing();
                    case 3:
                      return const MovieListing();
                    case 4:
                      return const MenuRoute();
                    default:
                      return const MovieListing();
                  }
                  // return widget.children;
                },
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: CustomBottomNavigation(
      //   routeName: widget.routeName,
      // ),
      bottomNavigationBar: Consumer<BottomMenuProvier>(
        builder: (context, notifier, child) {
          return CustomBottomNavigation(
            activeMenu: notifier.activeMenuIndex,
            onTapNavigation: (index) {
              final provider = Provider.of<BottomMenuProvier>(
                context,
                listen: false,
              );
              provider.changeBottomMenu(index);
            },
          );
        },
      ),
    );
  }
}
