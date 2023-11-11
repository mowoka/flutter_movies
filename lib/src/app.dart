import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:movie_moka/src/core/utils/material_color.dart';
import 'package:movie_moka/src/features/movies/data/repository/movie_listing_impl.dart';
import 'package:movie_moka/src/features/movies/presentation/providers/movie_listing_provider.dart';
import 'package:movie_moka/src/features/movies/presentation/routes/movie_listing.dart';
import 'package:provider/provider.dart';

/// The Widget that configures your application.
class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router;
  late final MovieListingProvider _movieListingProvider;

  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = "id_ID";
    initDependencies();
  }

  Future<String> getAccessToken() async {
    return '';
  }

  initDependencies() {
    _router = initRouter();
    // register repository
    final movieRepo = MovieListingRepositoryImpl(
      accessTokenGetter: getAccessToken,
    );

    // register provider
    _movieListingProvider = MovieListingProvider(repository: movieRepo);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MovieListingProvider>(
          create: (context) => _movieListingProvider,
        ),
      ],
      child: MaterialApp.router(
        title: "Flutter App",
        theme: ThemeData(
          fontFamily: 'Poppins',
          primarySwatch: createMaterialColor(fluAppLightOrangeColor),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 52,
              fontWeight: FontWeight.bold,
              color: fluAppLightOrangeColor,
            ),
            displayMedium: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: fluAppLightOrangeColor,
            ),
            titleLarge: TextStyle(fontSize: 12, color: Colors.black38),
            bodyLarge: TextStyle(fontSize: 14),
            bodyMedium: TextStyle(fontSize: 12),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(fontSize: 14),
            contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 8),
            isDense: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.black38)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: fluAppLightOrangeColor),
            ),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
              width: 1,
              color: Colors.redAccent,
            )),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.redAccent),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.black38),
            ),
            errorStyle:
                TextStyle(fontSize: 12, height: .3, color: Colors.redAccent),
          ),
          radioTheme: const RadioThemeData(
            fillColor: MaterialStatePropertyAll(fluAppLightOrangeColor),
          ),
          checkboxTheme: const CheckboxThemeData(
            fillColor: MaterialStatePropertyAll(fluAppLightOrangeColor),
          ),
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: const [Locale('id', 'ID')],
        routerConfig: _router,
      ),
    );
  }

  GoRouter initRouter() {
    final router = GoRouter(
      routes: [
        GoRoute(
          name: MovieListing.routeName,
          path: MovieListing.routePath,
          builder: (context, state) => const MovieListing(),
        ),
      ],
    );

    return router;
  }
}
