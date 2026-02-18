import 'package:flutter/material.dart';

// lol

class RainbowFireIcon extends StatefulWidget {
  const RainbowFireIcon({super.key});

  @override
  State<RainbowFireIcon> createState() => _RainbowFireIconState();
}

class _RainbowFireIconState extends State<RainbowFireIcon>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [
                Colors.red,
                Colors.orange,
                Colors.yellow,
                Colors.green,
                Colors.blue,
                Colors.purple,
                Colors.red,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(
              Rect.fromLTWH(
                -bounds.width + (bounds.width * 2 * _controller.value),
                0,
                bounds.width * 2,
                bounds.height,
              ),
            );
          },
          child: const Icon(
            Icons.local_fire_department,
            size: 25,
            color: Colors.white,
          ),
        );
      },
    );
  }
}
