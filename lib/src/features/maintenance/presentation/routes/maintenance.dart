import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_ink_well.dart';
import 'package:movie_moka/src/features/movies/presentation/routes/movie_home.dart';

class Maintenance extends StatefulWidget {
  const Maintenance({super.key});

  static const routeName = 'maintenance';
  static const routePath = '/maintenance';

  @override
  State<Maintenance> createState() => _MaintenanceState();
}

class _MaintenanceState extends State<Maintenance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Oppss Sory ...',
              style: TextStyle(
                fontSize: 32,
                color: Colors.grey.shade700,
              ),
            ),
            Icon(
              Icons.construction,
              size: 200,
              color: Colors.red.shade400,
            ),
            Text(
              'We apology, the page still under construction',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
              ),
            ),
            MokaInkWell(
              onTap: () {
                GoRouter.of(context).pushNamed(MovieHome.routeName);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(4)),
                child: const Center(
                  child: Text(
                    'Back To Home',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
