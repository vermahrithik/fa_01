import 'package:flutter/material.dart';
import 'dart:math';
import 'package:go_router/go_router.dart';

class SingleTickerAnimation extends StatefulWidget {
  const SingleTickerAnimation({super.key});

  @override
  State<SingleTickerAnimation> createState() => _SingleTickerAnimationState();
}

enum CircleSide { left , right }

extension ToPath on CircleSide{
  Path toPath(Size size){
    var path = Path();

    late Offset offset;
    late bool clockwise;

    switch (this){
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockwise=false;
        break;
      case CircleSide.right:
        offset = Offset(0, size.height);
        clockwise = true;
        break;
    }
    path.arcToPoint(
        offset,
        radius: Radius.elliptical(size.width/2, size.height/2),
        clockwise: clockwise
    );
    path.close();
    return path;
  }
}

class HalfCircleClipper extends CustomClipper<Path>{

  final CircleSide side;

  HalfCircleClipper({required this.side});

  @override
  Path getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

}

extension on VoidCallback{
  Future<void> delayed(Duration duration) => Future.delayed(duration,this);
}

class _SingleTickerAnimationState extends State<SingleTickerAnimation> with SingleTickerProviderStateMixin{

  late AnimationController _counterClockwiseRotationController;
  late Animation<double> _counterClockwiseRotationAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counterClockwiseRotationController = AnimationController(
        vsync: this,
        duration: const Duration(
            seconds: 1
        )
    );
    _counterClockwiseRotationAnimation = Tween<double>(
      begin: 0,
      end: -(pi/2),
    ).animate(
        CurvedAnimation(
            parent: _counterClockwiseRotationController,
            curve: Curves.bounceOut
        )
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _counterClockwiseRotationController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    _counterClockwiseRotationController
      ..reset()
      ..forward.delayed(
          const Duration(
              seconds: 1
          )
      );

    return Scaffold(
      // backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: true,
        title: Text('SingleTicker Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _counterClockwiseRotationController,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.identity()..rotateZ(_counterClockwiseRotationAnimation.value),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipPath(
                    clipper: HalfCircleClipper(side: CircleSide.left),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          color: Color(0xff0057b7)
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: HalfCircleClipper(side: CircleSide.right),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          color: Color(0xffffd700)
                      ),
                    ),
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