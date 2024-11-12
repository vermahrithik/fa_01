import 'dart:math' show pi;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(brightness: Brightness.dark),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      home: const HomeScreen(),
    );
  }
}

const widthAndHeight = 100.0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;
  late Tween<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _xController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20)
    );

    _yController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30)
    );

    _zController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40)
    );

    _animation = Tween<double>(
      begin: 0,
      end: pi*2,
    );

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: widthAndHeight,
              width: double.infinity,
            ),
            Stack(
              children: [
                Container(
                  color: Colors.red,
                  height: widthAndHeight,
                  width: widthAndHeight,
                )
              ],
            )
          ],
        )
      ),
    );
  }
}
