import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:movie_moka/src/core/presentation/provider/bottom_menu_provider.dart';
import 'package:movie_moka/src/core/utils/get_route_location.dart';
import 'package:movie_moka/src/core/utils/material_color.dart';
import 'package:movie_moka/src/core/presentation/widgets/scaffold.dart';
import 'package:movie_moka/src/core/utils/moka_page_transition.dart';
import 'package:movie_moka/src/features/auth/data/repository/forgot_password_impl.dart';
import 'package:movie_moka/src/features/auth/presentation/providers/forgot_password_provider.dart';
import 'package:movie_moka/src/features/auth/presentation/routes/forgot_password.dart';
import 'package:movie_moka/src/features/auth/presentation/routes/login.dart';
import 'package:movie_moka/src/features/auth/presentation/routes/login_with_email.dart';
import 'package:movie_moka/src/features/auth/presentation/routes/register.dart';
import 'package:movie_moka/src/features/foods/presentation/routes/foods.dart';
import 'package:movie_moka/src/features/maintenance/presentation/routes/maintenance.dart';
import 'package:movie_moka/src/features/menu/presentation/routes/menu.dart';
import 'package:movie_moka/src/features/movies/data/repository/movie_listing_impl.dart';
import 'package:movie_moka/src/features/movies/presentation/providers/movie_listing_provider.dart';
import 'package:movie_moka/src/features/movies/presentation/routes/movie_detail.dart';
import 'package:movie_moka/src/features/movies/presentation/routes/movie_home.dart';
import 'package:movie_moka/src/features/movies/presentation/routes/movie_listing.dart';
import 'package:movie_moka/src/features/movies/presentation/routes/movie_listing_search_location.dart';
import 'package:movie_moka/src/features/my_cgv/presentation/routes/my_cgv.dart';
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
  late final BottomMenuProvier _bottomMenuProvier;
  late final ForgotPasswordProvider _forgotPasswordProvider;
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
    // feat auth
    final forgoPasswordRepo = ForgotPasswordRepositoryImpl(
      accessTokenGetter: getAccessToken,
    );
    // feat movie
    final movieRepo = MovieListingRepositoryImpl(
      accessTokenGetter: getAccessToken,
    );

    // register provider
    _bottomMenuProvier = BottomMenuProvier();
    _movieListingProvider = MovieListingProvider(
      repository: movieRepo,
    );
    _forgotPasswordProvider = ForgotPasswordProvider(
      repository: forgoPasswordRepo,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomMenuProvier>(
          create: (context) => _bottomMenuProvier,
        ),
        ChangeNotifierProvider<ForgotPasswordProvider>(
          create: (context) => _forgotPasswordProvider,
        ),
        ChangeNotifierProvider<MovieListingProvider>(
          create: (context) => _movieListingProvider,
        ),
      ],
      child: MaterialApp.router(
        title: "Flutter App",
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
          ),
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
          name: Maintenance.routeName,
          path: Maintenance.routePath,
          pageBuilder: (context, state) {
            return customTransitionPage(
              pageKey: state.pageKey,
              child: const Maintenance(),
            );
          },
        ),
        GoRoute(
          name: MovieHome.routeName,
          path: MovieHome.routePath,
          builder: (context, state) => CustomScaffold(
            routeName: getLocationRoute(MovieHome.routeName),
            children: const MovieHome(),
          ),
          routes: [
            GoRoute(
              name: MovieListingSearchLocation.routeName,
              path: MovieListingSearchLocation.routePath,
              pageBuilder: (context, state) {
                return customTransitionPage(
                  pageKey: state.pageKey,
                  child: const MovieListingSearchLocation(),
                );
              },
            ),
            GoRoute(
              name: MovieListing.routeName,
              path: MovieListing.routePath,
              pageBuilder: (context, state) {
                return customTransitionPage(
                  pageKey: state.pageKey,
                  child: const MovieListing(),
                );
              },
            ),
            GoRoute(
              name: MovieDetail.routeName,
              path: MovieDetail.routePath,
              pageBuilder: (context, state) {
                return customTransitionPage(
                  pageKey: state.pageKey,
                  child: const MovieDetail(),
                );
              },
            ),
          ],
        ),
        GoRoute(
          name: MenuRoute.routeName,
          path: MenuRoute.routePath,
          builder: (context, state) => CustomScaffold(
            routeName: getLocationRoute(MenuRoute.routeName),
            children: const MenuRoute(),
          ),
        ),
        GoRoute(
          name: Foods.routeName,
          path: Foods.routePath,
          builder: (context, state) => CustomScaffold(
            routeName: getLocationRoute(Foods.routeName),
            children: const Foods(),
          ),
        ),
        GoRoute(
          name: MyCgv.routeName,
          path: MyCgv.routePath,
          builder: (context, state) => CustomScaffold(
            routeName: getLocationRoute(MyCgv.routeName),
            children: const MyCgv(),
          ),
        ),
        GoRoute(
          name: Login.routeName,
          path: Login.routePath,
          pageBuilder: (context, state) {
            return customTransitionPage(
              pageKey: state.pageKey,
              child: const Login(),
            );
          },
          routes: [
            GoRoute(
              name: LoginWithEmail.routeName,
              path: LoginWithEmail.routePath,
              pageBuilder: (context, state) {
                return customTransitionPage(
                  pageKey: state.pageKey,
                  child: const LoginWithEmail(),
                );
              },
            ),
          ],
        ),
        GoRoute(
          name: ForgotPassword.routeName,
          path: ForgotPassword.routePath,
          pageBuilder: (context, state) {
            return customTransitionPage(
              pageKey: state.pageKey,
              child: const ForgotPassword(),
            );
          },
        ),
        GoRoute(
          name: Register.routeName,
          path: Register.routePath,
          pageBuilder: (context, state) {
            return customTransitionPage(
              pageKey: state.pageKey,
              child: const Register(),
            );
          },
        ),
      ],
    );

    return router;
  }
}
