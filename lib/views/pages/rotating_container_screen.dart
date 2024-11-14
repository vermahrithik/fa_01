import 'package:flutter/material.dart';
import 'dart:math';
import 'package:go_router/go_router.dart';

class RotatingContainer extends StatefulWidget {
  const RotatingContainer({super.key});

  @override
  State<RotatingContainer> createState() => _RotatingContainerState();
}

class _RotatingContainerState extends State<RotatingContainer> with SingleTickerProviderStateMixin{

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
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: true,
        title: Text('Rotating Container Animation'),
      ),
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