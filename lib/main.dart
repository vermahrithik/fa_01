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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _animation = Tween<double>(begin: 0.0,end: 2 * pi).animate(_controller);

    _controller.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade800,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.identity()..rotateZ(_animation.value),
              alignment: Alignment.center,
              // origin: Offset(0, 0),
              child: Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(20),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.white.withOpacity(0.4),
                  //     spreadRadius: 4,
                  //     offset: Offset(0, 0),
                  //     blurRadius: 8
                  //   ),
                  //   BoxShadow(
                  //       color: Colors.black.withOpacity(0.9),
                  //       spreadRadius: 4,
                  //       offset: Offset(4, 4),
                  //       blurRadius: 8
                  //   )
                  // ]
                ),
                child: Center(
                  child: Text('Atari',style: TextStyle(fontFamily: 'atari',fontSize: 24,color: Colors.white),),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}