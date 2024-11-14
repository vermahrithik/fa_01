import 'package:flutter/material.dart';
import 'dart:math';
import 'package:go_router/go_router.dart';

class TickerAnimation extends StatefulWidget {
  const TickerAnimation({super.key});

  @override
  State<TickerAnimation> createState() => _TickerAnimationState();
}

enum CircleSide { left, right }

extension ToPath on CircleSide {
  Path toPath(Size size) {
    var path = Path();

    late Offset offset;
    late bool clockwise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockwise = false;
        break;
      case CircleSide.right:
        offset = Offset(0, size.height);
        clockwise = true;
        break;
    }
    path.arcToPoint(offset,
        radius: Radius.elliptical(size.width / 2, size.height / 2),
        clockwise: clockwise);
    path.close();
    return path;
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  final CircleSide side;

  HalfCircleClipper({required this.side});

  @override
  Path getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

extension on VoidCallback {
  Future<void> delayed(Duration duration) => Future.delayed(duration, this);
}

class _TickerAnimationState extends State<TickerAnimation> with TickerProviderStateMixin {
  late AnimationController _counterClockwiseRotationController;
  late Animation<double> _counterClockwiseRotationAnimation;

  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counterClockwiseRotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _counterClockwiseRotationAnimation = Tween<double>(
      begin: 0,
      end: -(pi / 2),
    ).animate(CurvedAnimation(
        parent: _counterClockwiseRotationController, curve: Curves.easeOutExpo));

    // flipAnimation :
    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _flipAnimation = Tween<double>(
      begin: 0,
      end: pi,
    ).animate(
        CurvedAnimation(parent: _flipController, curve: Curves.easeOutExpo));

    // status listener :
    _counterClockwiseRotationController.addStatusListener(
          (status) {
        if (status == AnimationStatus.completed) {
          _flipAnimation = Tween<double>(
            begin: _flipAnimation.value,
            end: _flipAnimation.value + pi,
          ).animate(CurvedAnimation(
              parent: _flipController, curve: Curves.easeOutExpo));

          // reset the flip controller and start the animation :
          _flipController
            ..reset()
            ..forward();
        }
      },
    );

    _flipController.addStatusListener(
          (status) {
        if (status == AnimationStatus.completed) {
          _counterClockwiseRotationAnimation = Tween<double>(
            begin: _counterClockwiseRotationAnimation.value,
            end: _counterClockwiseRotationAnimation.value + -(pi/2),
          ).animate(CurvedAnimation(
              parent: _counterClockwiseRotationController, curve: Curves.easeOutExpo
          )
          );
          _counterClockwiseRotationController..reset()..forward();
        }


      },
    );

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _counterClockwiseRotationController.dispose();
    _flipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _counterClockwiseRotationController
      ..reset()
      ..forward.delayed(const Duration(seconds: 1));

    return Scaffold(
      // backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: true,
        title: Text('Ticker Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _counterClockwiseRotationController,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.identity()
                ..rotateZ(_counterClockwiseRotationAnimation.value),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _flipController,
                    builder: (context, child) {
                      return Transform(
                        alignment: Alignment.centerRight,
                        transform: Matrix4.identity()
                          ..rotateY(_flipAnimation.value),
                        child: ClipPath(
                          clipper: HalfCircleClipper(side: CircleSide.left),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration:
                            const BoxDecoration(color: Color(0xff0057b7)),
                          ),
                        ),
                      );
                    },
                  ),
                  AnimatedBuilder(
                    animation: _flipAnimation,
                    builder: (context, child) {
                      return Transform(
                        transform: Matrix4.identity()
                          ..rotateY(_flipAnimation.value),
                        alignment: Alignment.centerLeft,
                        child: ClipPath(
                          clipper: HalfCircleClipper(side: CircleSide.right),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration:
                            const BoxDecoration(color: Color(0xffffd700)),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}