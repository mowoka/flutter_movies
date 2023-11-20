import 'package:flutter/material.dart';
import 'package:movie_moka/src/core/presentation/provider/bottom_menu_provider.dart';
import 'package:movie_moka/src/core/presentation/widgets/app_bar.dart';
import 'package:movie_moka/src/core/presentation/widgets/bottom_navigation.dart';
import 'package:movie_moka/src/core/presentation/widgets/modal_ticket_options.dart';
import 'package:movie_moka/src/features/foods/presentation/routes/foods.dart';
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
            Consumer<BottomMenuProvier>(builder: (context, notifier, child) {
              Variant variant = [2].contains(notifier.activeMenuIndex)
                  ? Variant.sencondary
                  : Variant.primary;

              return CustomAppBar(
                variant: variant,
              );
            }),
            Expanded(
              child: Consumer<BottomMenuProvier>(
                builder: (context, notifier, child) {
                  switch (notifier.activeMenuIndex) {
                    case 0:
                      return const MovieListing();
                    case 2:
                      return const Foods();
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
              if (index == 1) {
                // show bottom modal because ticket have not screen
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    isScrollControlled: true,
                    constraints: const BoxConstraints(
                      maxHeight: 300,
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return const ModalTicketOptions();
                    });
                return;
              }
              final bottomProvider = Provider.of<BottomMenuProvier>(
                context,
                listen: false,
              );
              bottomProvider.changeBottomMenu(index);
            },
          );
        },
      ),
    );
  }
}
