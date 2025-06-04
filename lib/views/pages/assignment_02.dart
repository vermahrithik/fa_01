import 'package:flutter/material.dart';
import 'dart:math';

const widthAndHeight = 100.0;

class Assignment02 extends StatefulWidget {
  const Assignment02({super.key});

  @override
  Assignment02State createState() => Assignment02State();
}

class Assignment02State extends State<Assignment02> {
  double rotationX = 0.0;
  double rotationY = 0.0;
  double rotationZ = 0.0;
  // final double cubeSize = 100.0; // Side length of the cube

  // Gesture callback to update rotation
  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      // Adjust sensitivity
      rotationX += details.delta.dy * 0.01;
      rotationY -= details.delta.dx * 0.01;
    });
  }

  // Cube face builder
  Widget _buildFace({
    required Alignment alignment,
    double? translateZ = 0.0,
    double? rotateX = 0,
    double? rotateY = 0,
    required Color color,
  }) {
    Matrix4 transform = Matrix4.identity();
    if (rotateX != null) transform..rotateX(rotateX);
    if (rotateY != null) transform..rotateY(rotateY);
    if (translateZ != null) transform..translate(0.0, 0.0, translateZ);

    return Transform(
      alignment: alignment,
      transform: transform,
      child: Container(
        width: widthAndHeight,
        height: widthAndHeight,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onPanUpdate: _onPanUpdate,
            child: Center(
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..rotateX(rotationX)
                  ..rotateY(rotationY),
                child: Stack(
                  children: [
                    // Back face
                    _buildFace(
                      alignment: Alignment.center,
                      translateZ: -widthAndHeight,
                      color: Colors.purple,
                    ),
                    // Left face
                    _buildFace(
                      alignment: Alignment.centerLeft,
                      rotateY: pi / 2,
                      color: Colors.red,
                    ),
                    // Right face
                    _buildFace(
                      alignment: Alignment.centerRight,
                      rotateY: -pi / 2,
                      color: Colors.blue,
                    ),
                    // Front face
                    _buildFace(
                      alignment: Alignment.center,
                      color: Colors.green,
                    ),
                    // Top face
                    _buildFace(
                      alignment: Alignment.topCenter,
                      rotateX: -pi / 2,
                      color: Colors.orange,
                    ),
                    // Bottom face
                    _buildFace(
                      alignment: Alignment.bottomCenter,
                      rotateX: pi / 2,
                      color: Colors.brown,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Sliders for controlling rotations
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // X Rotation Slider
                Text("Rotation X: ${rotationX.toStringAsFixed(2)}"),
                Slider(
                  min: -180,
                  max: 180,
                  value: rotationX > 0 ? rotationX : 0,
                  onChanged: (value) {
                    setState(() {
                      rotationX = value;
                    });
                  },
                ),
                // Y Rotation Slider
                Text("Rotation Y: ${rotationY.toStringAsFixed(2)}"),
                Slider(
                  min: -180,
                  max: 180,
                  value: rotationY > 0 ? rotationY : 0,
                  onChanged: (value) {
                    setState(() {
                      rotationY = value;
                    });
                  },
                ),
                // Z Rotation Slider
                Text("Rotation Z: ${rotationZ.toStringAsFixed(2)}"),
                Slider(
                  min: -180,
                  max: 180,
                  value: rotationZ>0 ? rotationZ : 0,
                  onChanged: (value) {
                    setState(() {
                      rotationZ = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}