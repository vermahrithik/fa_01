import 'package:a/models/person_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailsScreen extends StatelessWidget {
  final Person person;
  const DetailsScreen({super.key,required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Hero(
          flightShuttleBuilder: (
              flightContext,
              animation,
              flightDirection,
              fromHeroContext,
              toHeroContext
              ){
            switch (flightDirection){
              case HeroFlightDirection.push :
                return Material(
                  color: Colors.transparent,
                  child: ScaleTransition(
                    scale: animation.drive(
                      Tween<double>(
                        begin: 0.0,
                        end: 1.5,
                      ).chain(
                        CurveTween(
                          curve: Curves.fastOutSlowIn
                        ),
                      ),
                    ),
                    child: toHeroContext.widget
                  ),
                );
              case HeroFlightDirection.pop :
                return Material(
                  color: Colors.transparent,
                  child: ScaleTransition(
                    scale: animation.drive(
                      Tween<double>(
                        begin: 0,
                        end: 1.5,
                      ).chain(
                        CurveTween(
                            curve: Curves.fastOutSlowIn
                        ),
                      ),
                    ),
                    child: fromHeroContext.widget
                  ),
                );
            }
          },
          tag: person.name,
            child: Text(
              person.emoji,
              style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.white
              ),
            ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(person.name,style: TextStyle(fontSize: 18.sp,color: Colors.white),),
            Text('${person.age} years old',style: TextStyle(fontSize: 16.sp,color: Colors.white),),
          ],
        ),
      ),
    );
  }
}
