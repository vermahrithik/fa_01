import 'package:a/models/person_model.dart';
import 'package:a/routing/route_names.dart';
import 'package:a/views/utils/constants/animation_names.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/render1.jpg'),
            fit: BoxFit.cover,
            alignment: Alignment.center),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Home Screen'),
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Container(
            height: 60.h,
            width: 70.w,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Rotating Circle Animation Button :
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(RouteNames.rotatingContainer);
                    },
                    child: GlassmorphicContainer(
                      width: 70.sp,
                      height: 25.sp,
                      borderRadius: 10.sp,
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.3),
                            Colors.white.withOpacity(0.1),
                          ],
                          stops: [
                            0.3,
                            1,
                          ]),
                      border: 0,
                      blur: 7,
                      borderGradient: LinearGradient(
                          colors: [Colors.transparent, Colors.white]),
                      child: Center(
                        child: Text(
                          AnimationNames.rotatingContainer,
                          style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20.sp,
                  ),

                  // SingleTicker Animation Button :
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(RouteNames.singleTicker);
                    },
                    child: GlassmorphicContainer(
                      width: 70.sp,
                      height: 25.sp,
                      borderRadius: 10.sp,
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.3),
                            Colors.white.withOpacity(0.1),
                          ],
                          stops: [
                            0.3,
                            1,
                          ]),
                      border: 0,
                      blur: 7,
                      borderGradient: LinearGradient(
                          colors: [Colors.transparent, Colors.white]),
                      child: Center(
                        child: Text(
                          AnimationNames.singleTicker,
                          style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20.sp,
                  ),

                  // Ticker Animation Button :
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(RouteNames.ticker);
                    },
                    child: GlassmorphicContainer(
                      width: 70.sp,
                      height: 25.sp,
                      borderRadius: 10.sp,
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.3),
                            Colors.white.withOpacity(0.1),
                          ],
                          stops: [
                            0.3,
                            1,
                          ]),
                      border: 0,
                      blur: 7,
                      borderGradient: LinearGradient(
                          colors: [Colors.transparent, Colors.white]),
                      child: Center(
                        child: Text(
                          AnimationNames.ticker,
                          style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20.sp,
                  ),

                  // 3D Cube Animation Button :
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(RouteNames.cube);
                    },
                    child: GlassmorphicContainer(
                      width: 70.sp,
                      height: 25.sp,
                      borderRadius: 10.sp,
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.3),
                            Colors.white.withOpacity(0.1),
                          ],
                          stops: [
                            0.3,
                            1,
                          ]),
                      border: 0,
                      blur: 7,
                      borderGradient: LinearGradient(
                          colors: [Colors.transparent, Colors.white]),
                      child: Center(
                        child: Text(
                          AnimationNames.cube,
                          style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20.sp,
                  ),

                  // Hero Animation Button :
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(RouteNames.hero);
                    },
                    child: GlassmorphicContainer(
                      width: 70.sp,
                      height: 25.sp,
                      borderRadius: 10.sp,
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.3),
                            Colors.white.withOpacity(0.1),
                          ],
                          stops: [
                            0.3,
                            1,
                          ]),
                      border: 0,
                      blur: 7,
                      borderGradient: LinearGradient(
                          colors: [Colors.transparent, Colors.white]),
                      child: Center(
                        child: Text(
                          AnimationNames.hero,
                          style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20.sp,
                  ),

                  // Zooming Effect Button :
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(RouteNames.zoom);
                    },
                    child: GlassmorphicContainer(
                      width: 70.sp,
                      height: 25.sp,
                      borderRadius: 10.sp,
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.3),
                            Colors.white.withOpacity(0.1),
                          ],
                          stops: [
                            0.3,
                            1,
                          ]),
                      border: 0,
                      blur: 7,
                      borderGradient: LinearGradient(
                          colors: [Colors.transparent, Colors.white]),
                      child: Center(
                        child: Text(
                          AnimationNames.zoom,
                          style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20.sp,
                  ),

                  // Tween Animation Button :
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(RouteNames.tween);
                    },
                    child: GlassmorphicContainer(
                      width: 70.sp,
                      height: 25.sp,
                      borderRadius: 10.sp,
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.3),
                            Colors.white.withOpacity(0.1),
                          ],
                          stops: [
                            0.3,
                            1,
                          ]),
                      border: 0,
                      blur: 7,
                      borderGradient: LinearGradient(
                          colors: [Colors.transparent, Colors.white]),
                      child: Center(
                        child: Text(
                          AnimationNames.tween,
                          style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20.sp,
                  ),

                  // Custom Shape Animation Button :
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(RouteNames.customShapeAnimation);
                    },
                    child: GlassmorphicContainer(
                      width: 70.sp,
                      height: 25.sp,
                      borderRadius: 10.sp,
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.3),
                            Colors.white.withOpacity(0.1),
                          ],
                          stops: [
                            0.3,
                            1,
                          ]),
                      border: 0,
                      blur: 7,
                      borderGradient: LinearGradient(
                          colors: [Colors.transparent, Colors.white]),
                      child: Center(
                        child: Text(
                          AnimationNames.customShapeAnimation,
                          style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 16.sp,
                  ),

                  // Next Animation Button :
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(RouteNames.threeDDrawer);
                    },
                    child: GlassmorphicContainer(
                      width: 70.sp,
                      height: 25.sp,
                      borderRadius: 10.sp,
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.3),
                            Colors.white.withOpacity(0.1),
                          ],
                          stops: [
                            0.3,
                            1,
                          ]),
                      border: 0,
                      blur: 7,
                      borderGradient: LinearGradient(
                          colors: [Colors.transparent, Colors.white]),
                      child: Center(
                        child: Text(
                          AnimationNames.threeDDrawer,
                          style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20.sp,
                  ),

                  // Animated Prompt Animation Button :
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(RouteNames.animatedPrompt);
                    },
                    child: GlassmorphicContainer(
                      width: 70.sp,
                      height: 25.sp,
                      borderRadius: 10.sp,
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.3),
                            Colors.white.withOpacity(0.1),
                          ],
                          stops: [
                            0.3,
                            1,
                          ]),
                      border: 0,
                      blur: 7,
                      borderGradient: LinearGradient(
                          colors: [Colors.transparent, Colors.white]),
                      child: Center(
                        child: Text(
                          AnimationNames.animatedPrompt,
                          style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20.sp,
                  ),

                  // Assignment 01 Wave Animation Button :
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(RouteNames.waveAnimation);
                    },
                    child: GlassmorphicContainer(
                      width: 70.sp,
                      height: 25.sp,
                      borderRadius: 10.sp,
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.3),
                            Colors.white.withOpacity(0.1),
                          ],
                          stops: [
                            0.3,
                            1,
                          ]),
                      border: 0,
                      blur: 7,
                      borderGradient: LinearGradient(
                          colors: [Colors.transparent, Colors.white]),
                      child: Center(
                        child: Text(
                          AnimationNames.waveAnimation,
                          style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
