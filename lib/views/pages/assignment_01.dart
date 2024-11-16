import 'package:flutter/material.dart';
import 'dart:math';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WaveAnimation extends StatefulWidget {
  const WaveAnimation({super.key});

  @override
  State<WaveAnimation> createState() => _WaveAnimationState();
}

enum Wave { top , bottom }

extension ToPath on Wave{
  Path toPath(Size size){
    var path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0,size.height/4);
    var firstStart = Offset(size.width/8,size.height/2);
    var firstEnd = Offset(size.width/4,size.height/4);
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart = Offset(size.width/4+size.width/8,0);
    // var secondStart = Offset((size.width/4)*3,size.height+50);
    var secondEnd = Offset(size.width/2,size.height/4);
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    var thirdStart = Offset(size.width/2+size.width/8,size.height/2);
    var thirdEnd = Offset(size.width/2+size.width/4,size.height/4);
    path.quadraticBezierTo(thirdStart.dx, thirdStart.dy, thirdEnd.dx, thirdEnd.dy);
    var fourthStart = Offset(size.width/2+size.width/4+size.width/8,0);
    var fourthEnd = Offset(size.width,size.height/4);
    path.quadraticBezierTo(fourthStart.dx, fourthStart.dy, fourthEnd.dx, fourthEnd.dy);
    path.lineTo(size.width,size.height);
    path.close();
    return path;
  }
}

class WaveClipper extends CustomClipper<Path>{

  final Wave side;

  WaveClipper({required this.side});

  @override
  Path getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

}

extension on VoidCallback{
  Future<void> delayed(Duration duration) => Future.delayed(duration,this);
}

class _WaveAnimationState extends State<WaveAnimation> with TickerProviderStateMixin{

  late AnimationController _wave01Controller;
  late Animation<double> _wave01Animation;

  late AnimationController _wave02Controller;
  late Animation<double> _wave02Animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // wave 01 initials :
    _wave01Controller = AnimationController(
        vsync: this,
        duration: const Duration(
            seconds: 2
        )
    );
    _wave01Animation = Tween<double>(
      begin: 0,
      end: 20.w,
    ).animate(
        CurvedAnimation(
            parent: _wave01Controller,
            curve: Curves.easeInOutExpo,
        )
    );

    // wave 02 initials :
    _wave02Controller = AnimationController(
        vsync: this,
        duration: const Duration(
            seconds: 2
        )
    );
    _wave02Animation = Tween<double>(
      begin: 0,
      end: -20.w,
    ).animate(
        CurvedAnimation(
          parent: _wave02Controller,
          curve: Curves.easeInOutExpo,
        )
    );

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _wave01Controller.repeat(reverse: true);
    _wave02Controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _wave01Controller.dispose();
    _wave02Controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        leading: BackButton(
          color: Colors.grey,
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: true,
        title: Text('Wave Animation',style: TextStyle(color: Colors.grey),),
      ),
      body: Center(
        child: ClipRRect(
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: _wave01Controller,
                builder: (context, child) {
                  return Transform(
                    transform: Matrix4.identity()..translate(_wave01Animation.value),
                    alignment: Alignment.center,
                    child: ClipPath(
                      clipper: WaveClipper(side: Wave.bottom),
                      child: Container(
                        height: 20.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                            color: Color(0xff0057b7).withOpacity(0.3),
                            // color: Color(0xffffd700).withOpacity(0.3),
                        ),
                      ),
                    ),
                  );
                },
              ),
              AnimatedBuilder(
                animation: _wave02Controller,
                builder: (context, child) {
                  return Transform(
                    transform: Matrix4.identity()..translate(_wave02Animation.value),
                    alignment: Alignment.center,
                    child: ClipPath(
                      clipper: WaveClipper(side: Wave.top),
                      child: Container(
                        height: 20.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                            color: Color(0xff0057b7).withOpacity(0.3),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Container(
                height: 20.h,
                width: 80.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex:1,
                      child: Container(
                        height: 20.h,
                        // width: 400/3,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      flex:2,
                      child: Container(
                        height: 20.h,
                        // width: 400/3,
                        color: Colors.transparent,
                      ),
                    ),
                    Expanded(
                      flex:1,
                      child: Container(
                        height: 20.h,
                        // width: 400/3,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}