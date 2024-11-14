import 'package:a/models/person_model.dart';
import 'package:a/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 4.h,),

            // Rotating Circle Animation Button :
            SizedBox(
              height: 25.sp,
              width: 70.sp,
              child: ElevatedButton(
                onPressed: (){
                  context.pushNamed(RouteNames.rotatingContainer);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    padding: EdgeInsets.all(0.sp)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Rotating Container Animation',style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),)
                  ],
                ),
              ),
            ),

            SizedBox(height: 4.h,),

            // SingleTicker Animation Button :
            SizedBox(
              height: 25.sp,
              width: 70.sp,
              child: ElevatedButton(
                onPressed: (){
                  context.pushNamed(RouteNames.singleTicker);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    padding: EdgeInsets.all(0.sp)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Single Ticker Animation',style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),)
                  ],
                ),
              ),
            ),

            SizedBox(height: 4.h,),

            // Ticker Animation Button :
            SizedBox(
              height: 25.sp,
              width: 70.sp,
              child: ElevatedButton(
                onPressed: (){
                  context.pushNamed(RouteNames.ticker);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    padding: EdgeInsets.all(0.sp)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Ticker Animation',style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),)
                  ],
                ),
              ),
            ),

            SizedBox(height: 4.h,),

            // 3D Cube Animation Button :
            SizedBox(
              height: 25.sp,
              width: 70.sp,
              child: ElevatedButton(
                onPressed: (){
                  context.pushNamed(RouteNames.cube);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    padding: EdgeInsets.all(0.sp)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('3D Cube Animation',style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),)
                  ],
                ),
              ),
            ),

            SizedBox(height: 4.h,),

            // Hero Animation Button :
            SizedBox(
              height: 25.sp,
              width: 70.sp,
              child: ElevatedButton(
                onPressed: (){
                  context.pushNamed(RouteNames.hero);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    padding: EdgeInsets.all(0.sp)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Hero Animation',style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),)
                  ],
                ),
              ),
            ),

            SizedBox(height: 4.h,),

            // Zooming Effect Button :
            SizedBox(
              height: 25.sp,
              width: 70.sp,
              child: ElevatedButton(
                onPressed: (){
                  context.pushNamed(RouteNames.zoom);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    padding: EdgeInsets.all(0.sp)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Zooming Effect',style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),)
                  ],
                ),
              ),
            ),

            SizedBox(height: 4.h,),

            // Tween Animation Button :
            SizedBox(
              height: 25.sp,
              width: 70.sp,
              child: ElevatedButton(
                onPressed: (){
                  context.pushNamed(RouteNames.tween);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    padding: EdgeInsets.all(0.sp)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Tween Animation',style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),)
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
