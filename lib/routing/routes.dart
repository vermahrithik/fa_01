import 'package:a/models/person_model.dart';
import 'package:a/views/pages/details_screen.dart';
import 'package:a/views/pages/error_screen.dart';
import 'package:a/views/pages/hero_animation_screen.dart';
import 'package:a/views/pages/home_screen.dart';
import 'package:a/views/pages/rotating_container_screen.dart';
import 'package:a/views/pages/single_ticker_screen.dart';
import 'package:a/views/pages/three_d_cube_screen.dart';
import 'package:a/views/pages/ticker_screen.dart';
import 'package:a/views/pages/tween_animation_screen.dart';
import 'package:a/views/pages/zoom_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:a/routing/route_names.dart';
import 'package:a/routing/route_paths.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyAppRouter{

  static final GoRouter router = GoRouter(
    initialLocation: RoutePaths.home,
    navigatorKey: navigatorKey,
    debugLogDiagnostics: true,
    errorPageBuilder: (context,state){
      return const MaterialPage(child: ErrorPage());
    },
    routes: [
      // home Page Route :
      GoRoute(
        name: RouteNames.home,
        path: RoutePaths.home,
        pageBuilder: (context,state){
          debugPrint('config page : HomeScreen');
          return const MaterialPage(child: HomeScreen());
        },
      ),
      // hero Page Route :
      GoRoute(
        name: RouteNames.hero,
        path: RoutePaths.hero,
        pageBuilder: (context,state){
          debugPrint('config page : HeroScreen');
          return const MaterialPage(child: HeroAnimationScreen());
        },
        routes: [
          GoRoute(
            name: RouteNames.details,
            path: '${RoutePaths.details}/:name/:age/:emoji',
            pageBuilder: (context,state){
              debugPrint('config page : DetailsScreen');
              final String name = state.pathParameters['name'] ?? "";
              final int age = int.parse(state.pathParameters['age'] ?? "0") ?? 0;
              final String emoji = state.pathParameters['emoji'] ?? "";
              final Person person = Person(name: name, age: age, emoji: emoji);
              return MaterialPage(child: DetailsScreen(person: person));
            },
          ),
        ]
      ),
      GoRoute(
          name: RouteNames.zoom,
          path: RoutePaths.zoom,
          pageBuilder: (context,state){
            debugPrint('config page : ZoomScreen');
            return const MaterialPage(child: ZoomScreen());
          },
      ),
      GoRoute(
          name: RouteNames.tween,
          path: RoutePaths.tween,
          pageBuilder: (context,state){
            debugPrint('config page : TweenScreen');
            return const MaterialPage(child: TweenAnimationScreen());
          },
      ),
      GoRoute(
          name: RouteNames.cube,
          path: RoutePaths.cube,
          pageBuilder: (context,state){
            debugPrint('config page : threeDCubeScreen');
            return const MaterialPage(child: ThreeDCubeAnimation());
          },
      ),
      GoRoute(
        name: RouteNames.singleTicker,
        path: RoutePaths.singleTicker,
        pageBuilder: (context,state){
          debugPrint('config page : singleTickerAnimationScreen');
          return const MaterialPage(child: SingleTickerAnimation());
        },
      ),
      GoRoute(
        name: RouteNames.ticker,
        path: RoutePaths.ticker,
        pageBuilder: (context,state){
          debugPrint('config page : tickerAnimationScreen');
          return const MaterialPage(child: TickerAnimation());
        },
      ),
      GoRoute(
        name: RouteNames.rotatingContainer,
        path: RoutePaths.rotatingContainer,
        pageBuilder: (context,state){
        debugPrint('config page : rotatingContainerAnimationScreen');
          return const MaterialPage(child: RotatingContainer());
        },
      ),
    ],
  );
}