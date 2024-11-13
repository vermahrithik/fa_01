import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:go_router/go_router.dart';

class ZoomScreen extends StatefulWidget {
  const ZoomScreen({super.key});

  @override
  State<ZoomScreen> createState() => _ZoomScreenState();
}

// final defaultWidth = 100.0.sp;
const defaultWidth = 100.0;

class _ZoomScreenState extends State<ZoomScreen> {

  var _isZoomedIn = false;
  var _buttonTitle = 'Zoom In';
  var _width = defaultWidth;
  var _curve = Curves.bounceOut;

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
        title: Text('Zooming Effect'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 2,
                child: SizedBox()
            ),
            Expanded(
              flex: 6,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 370,),
                width: _width,
                curve: _curve,
                child: Image.asset(
                  'assets/images/scene.jpg',
                  alignment: Alignment.center,
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Center(
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          _isZoomedIn = !_isZoomedIn;
                          _buttonTitle = _isZoomedIn ? 'Zoom Out' : 'Zoom In';
                          _width = _isZoomedIn ? MediaQuery.of(context).size.width : defaultWidth;
                          _curve = _isZoomedIn ? Curves.bounceInOut : Curves.bounceOut;
                        });
                      },
                      child: Text(_buttonTitle,style: TextStyle(color: Colors.white),)
                  ),
                )
            ),
            Expanded(
                flex: 1,
                child: SizedBox()
            ),
          ],
        ),
      ),
    );
  }
}
