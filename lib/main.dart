import 'dart:math' show pi;
import 'package:flutter/material.dart';
// import 'package:vector_math/vector_math.dart' as VectorMath;

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

    _xController =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));

    _yController =
        AnimationController(vsync: this, duration: const Duration(seconds: 30));

    _zController =
        AnimationController(vsync: this, duration: const Duration(seconds: 40));

    _animation = Tween<double>(
      begin: 0,
      end: pi * 2,
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
    _xController
      ..reset()
      ..repeat();
    _yController
      ..reset()
      ..repeat();
    _zController
      ..reset()
      ..repeat();

    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: widthAndHeight,
            width: double.infinity,
          ),
          AnimatedBuilder(
            animation:
                Listenable.merge([_xController, _yController, _zController]),
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..rotateX(_animation.evaluate(_xController))
                  ..rotateY(_animation.evaluate(_yController))
                  ..rotateZ(_animation.evaluate(_zController)),
                child: Stack(
                  children: [
                    // back
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..translate(0, 0, -widthAndHeight),
                      child: Container(
                        height: widthAndHeight,
                        width: widthAndHeight,
                        decoration: BoxDecoration(
                            // color: Colors.purple,
                            gradient: RadialGradient(colors: [Colors.purple,Colors.transparent]),
                            border: Border.fromBorderSide(BorderSide(color: Colors.white,width: 1))
                        ),
                      ),
                    ),
                    // left
                    Transform(
                      alignment: Alignment.centerLeft,
                      transform: Matrix4.identity()..rotateY(pi/2.0),
                      child: Container(
                        height: widthAndHeight,
                        width: widthAndHeight,
                        decoration: BoxDecoration(
                          // color: Colors.red,
                            gradient: RadialGradient(colors: [Colors.red,Colors.transparent]),
                          border: Border.fromBorderSide(BorderSide(color: Colors.white,width: 1))
                        ),
                      ),
                    ),
                    // right
                    Transform(
                      alignment: Alignment.centerRight,
                      transform: Matrix4.identity()..rotateY(-pi/2.0),
                      child: Container(
                        height: widthAndHeight,
                        width: widthAndHeight,
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            gradient: RadialGradient(colors: [Colors.blue,Colors.transparent]),
                          border: Border.fromBorderSide(BorderSide(color: Colors.white,width: 1))
                        ),
                      ),
                    ),
                    // front
                    Container(
                      height: widthAndHeight,
                      width: widthAndHeight,
                      decoration: const BoxDecoration(
                          // color: Colors.green,
                          gradient: RadialGradient(colors: [Colors.green,Colors.transparent]),
                          border: Border.fromBorderSide(BorderSide(color: Colors.white,width: 1))
                      ),
                    ),
                    // top
                    Transform(
                      alignment: Alignment.topCenter,
                      transform: Matrix4.identity()..rotateX(-pi/2.0),
                      child: Container(
                        height: widthAndHeight,
                        width: widthAndHeight,
                        decoration: BoxDecoration(
                            // color: Colors.orange,
                            gradient: RadialGradient(colors: [Colors.orange,Colors.transparent]),
                            border: Border.fromBorderSide(BorderSide(color: Colors.white,width: 1))
                        ),
                      ),
                    ),
                    // bottom
                    Transform(
                      alignment: Alignment.bottomCenter,
                      transform: Matrix4.identity()..rotateX(pi/2.0),
                      child: Container(
                        height: widthAndHeight,
                        width: widthAndHeight,
                        decoration: BoxDecoration(
                          // color: Colors.brown,
                            gradient: RadialGradient(colors: [Colors.brown,Colors.transparent,]),
                            border: Border.fromBorderSide(BorderSide(color: Colors.white,width: 1))
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      )),
    );
  }
}
