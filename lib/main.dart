import 'dart:math' show pi;
import 'package:a/binding/initial_bindings.dart';
import 'package:a/models/person_model.dart';
import 'package:a/routing/routes.dart';
import 'package:a/views/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  GoRouter.optionURLReflectsImperativeAPIs = true;
  setPathUrlStrategy();
  debugPrint('setpathurlstrategy : ok');
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint('WidgetsFlutterBinding : ok');
  DependencyInjector.initializeControllers();
  debugPrint('blogController : ok');
  GoRouter router = MyAppRouter.router;
  debugPrint('GoRouter router= MyAppRouter.router; : ok');
  runApp(MyApp(routerr: router));
  debugPrint('GoRouter router= MyAppRouter.router; : ok');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.routerr});
  final GoRouter routerr;
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screentype) {
        return GetMaterialApp.router(
          theme: ThemeData(brightness: Brightness.dark),
          darkTheme: ThemeData(brightness: Brightness.dark),
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          routeInformationParser: routerr.routeInformationParser,
          routerDelegate: routerr.routerDelegate,
          routeInformationProvider: routerr.routeInformationProvider,
        );
      },
    );
  }
}