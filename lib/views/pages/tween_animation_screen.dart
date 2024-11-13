import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:math' as math;
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log()=>devtools.log(toString());
}

class CircleClipper extends CustomClipper<Path>{
  const CircleClipper();
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();

    final rect = Rect.fromCircle(
        center: Offset(size.width/2, size.height/2),
        radius: size.width/2,
    );

    path.addOval(rect);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
  
}

Color getRandomColor() => Color(0xFF000000 + math.Random().nextInt(0x00FFFFFF));

class TweenAnimationScreen extends StatefulWidget {
  const TweenAnimationScreen({super.key});

  @override
  State<TweenAnimationScreen> createState() => _TweenAnimationScreenState();
}

class _TweenAnimationScreenState extends State<TweenAnimationScreen> {
  var _color = getRandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: true,
        title: Text('Tween Colours Effect'),
      ),
      body: Center(
        child: ClipPath(
          clipper: const CircleClipper(),
          child: TweenAnimationBuilder(
            duration: Duration(seconds: 1),
            tween: ColorTween(
              begin: getRandomColor(),
              end: _color,
            ),
            onEnd: (){
              setState(() {
                _color = getRandomColor();
              });
            },
            child: Container(
              height: 75.sp,
              width: 75.sp,
              color: Colors.red,
            ),
            builder: (context, Color? color, child) {
              return ColorFiltered(
                colorFilter: ColorFilter.mode(
                    color!,
                    BlendMode.srcATop
                ),
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}
