import 'dart:math';

import 'package:flutter/material.dart';
import 'package:a/views/widgets/animated_prompts.dart';
import 'package:go_router/go_router.dart';
import 'package:confetti/confetti.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AnimatedPrompt extends StatefulWidget {
  const AnimatedPrompt({Key? key}) : super(key: key);

  @override
  State<AnimatedPrompt> createState() => _AnimatedPromptState();
}

class _AnimatedPromptState extends State<AnimatedPrompt> {

  final _controller = ConfettiController();
  bool isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                context.pop();
              },
            ),
            centerTitle: true,
            title: const Text('Animated Prompt'),
          ),
          body: const Center(
            child:  AnimatedPromptWidget(
              title: 'Your Order has been placed successfully !!',
              subTitle: 'Your order will be delivered in 2 days. Enjoy!',
              child: Icon(
                Icons.check,
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0.w, -2.2.h),
          child: ConfettiWidget(
            confettiController: _controller,
            blastDirection: pi/2,
            colors: [
              Color(0xFFFFE135).withOpacity(0.8), // Banana Yellow
              Color(0xFFFF7F50).withOpacity(0.8), // Coral
              Color(0xFF20B2AA).withOpacity(0.8), // Light Sea Green
              Color(0xFFFF1493).withOpacity(0.8), // Deep Pink
              Color(0xFF1E90FF).withOpacity(0.8), // Dodger Blue
              Color(0xFFFFA07A).withOpacity(0.8), // Light Salmon
              Color(0xFF32CD32).withOpacity(0.8), // Lime Green
              Color(0xFF8A2BE2).withOpacity(0.8), // Blue Violet
              Color(0xFFFF6347).withOpacity(0.8), // Tomato Red
              Color(0xFF00FA9A).withOpacity(0.8), // Medium Spring Green
              Color(0xFFFF4500).withOpacity(0.8), // Orange Red
              Color(0xFFDA70D6).withOpacity(0.8), // Orchid
              Color(0xFF00CED1).withOpacity(0.8), // Dark Turquoise
              Color(0xFF7FFF00).withOpacity(0.8), // Chartreuse
              Color(0xFFDC143C).withOpacity(0.8), // Crimson
              Color(0xFFFFD700).withOpacity(0.8), // Gold
              Color(0xFF4169E1).withOpacity(0.8), // Royal Blue
              Color(0xFFFF69B4).withOpacity(0.8), // Hot Pink
              Color(0xFFFF8C00).withOpacity(0.8), // Dark Orange
              Color(0xFFADFF2F).withOpacity(0.8), // Green Yellow
            ],
            gravity: 0.04,
            emissionFrequency: 0.03,
            minBlastForce: 1.sp,
            maxBlastForce: 2.sp,
            // minimumSize: Size(0.5.sp, 0.1.sp),
            // blastDirectionality: BlastDirectionality.directional,
          ),
        )
      ],
    );
  }
}