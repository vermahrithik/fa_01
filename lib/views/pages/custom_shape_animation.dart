import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:go_router/go_router.dart';

class Polygon extends CustomPainter {
  final int sides;

  Polygon({
    required this.sides,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    final path = Path();

    final center = Offset(size.width / 2, size.height / 2);
    final angle = (2 * pi) / sides;

    final angles = List.generate(sides, (index) => index * angle);

    final radius = size.width / 2;

    path.moveTo(center.dx + radius * cos(0), center.dy + radius * sin(0));

    for (final angle in angles) {
      path.lineTo(
          center.dx + radius * cos(angle), center.dy + radius * sin(angle));
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate is Polygon && oldDelegate.sides != sides;
}

class CustomShapeAnimation extends StatefulWidget {
  const CustomShapeAnimation({super.key});

  @override
  State<CustomShapeAnimation> createState() => _CustomShapeAnimationState();
}

class _CustomShapeAnimationState extends State<CustomShapeAnimation>
    with TickerProviderStateMixin {
  late AnimationController _sidesController;
  late Animation<int> _sidesAnimation;

  late AnimationController _radiusController;
  late Animation<double> _radiusAnimation;

  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sidesController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _sidesAnimation = IntTween(
      begin: 3,
      end: 10,
    ).animate(_sidesController);

    _radiusController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _radiusAnimation = Tween(
      begin: 20.0,
      end: 400.0,
    )
        .chain(CurveTween(
          curve: Curves.bounceInOut,
        ))
        .animate(_radiusController);

    _rotationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _rotationAnimation = Tween(
      begin: 0.0,
      end: 2 * pi,
    ).chain(CurveTween(curve: Curves.easeInOut)).animate(_rotationController);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _sidesController.dispose();
    _radiusController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _sidesController.repeat(reverse: true);
    _radiusController.repeat(reverse: true);
    _rotationController.repeat(reverse: true);
  }

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
        title: Text('Custom Shape Animation'),
      ),
      body: Center(
          child: AnimatedBuilder(
        animation: Listenable.merge([
          _sidesController,
          _radiusController,
          _rotationController,
        ]),
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..rotateX(_rotationAnimation.value)
              ..rotateY(_rotationAnimation.value)
              ..rotateZ(_rotationAnimation.value),
            child: CustomPaint(
              painter: Polygon(sides: _sidesAnimation.value),
              child: SizedBox(
                width: _radiusAnimation.value,
                height: _radiusAnimation.value,
              ),
            ),
          );
        },
      )),
    );
  }
}
