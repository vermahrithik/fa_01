import 'package:a/models/person_model.dart';
import 'package:a/views/pages/details_screen.dart';
import 'package:a/views/pages/error_screen.dart';
import 'package:a/views/pages/home_screen.dart';
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
    ],
  );
}