import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
  static const name = 'animated_screen';

  const AnimatedContainerScreen({super.key});

  @override
  State<AnimatedContainerScreen> createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.amber;
  double borderRadius = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated container')),

      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
          width: width < 0 ? 0 : width,
          height: height < 0 ? 0 : height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
              borderRadius < 0 ? 0 : borderRadius,
            ),
          ),
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => changeShape(),
      //   child: const Icon(Icons.play_arrow_rounded),
      // ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,        
        children: [
          FloatingActionButton(
            onPressed: () => changeShape(),
            child: const Icon(Icons.play_arrow_rounded),
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            onPressed: () => changeColor(),
            child: const Icon(Icons.color_lens),
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            onPressed: () => changeWidth(),
            child: const Icon(Icons.compare_arrows_rounded),
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            onPressed: () => changeHeight(),
            child: const Icon(Icons.arrow_upward_rounded),
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            onPressed: () => changeBorderRadius(),
            child: const Icon(Icons.rounded_corner_rounded),
          ),
        ],
      ),
    );
  }

  void changeShape() {
    changeWidth();
    changeHeight();
    changeColor();

    setState(() {});
  }

  void changeWidth() {
    final random = Random();
    width = random.nextInt(300) + 50;
    setState(() {});
  }

  void changeHeight() {
    final random = Random();
    height = random.nextInt(300) + 50;
    setState(() {});
  }

  void changeBorderRadius() {
    final random = Random();
    borderRadius = random.nextInt(100).toDouble();
    setState(() {});
  }

  void changeColor() {
    final random = Random();
    color = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
    setState(() {});
  }
}
