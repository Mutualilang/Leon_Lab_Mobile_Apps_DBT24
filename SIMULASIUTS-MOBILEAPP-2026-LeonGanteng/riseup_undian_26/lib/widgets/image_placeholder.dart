import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  final String name;
  final double? width;
  final double? height;
  final Widget? child;
  final bool transparent;

  const ImagePlaceholder({
    super.key,
    required this.name,
    this.width,
    this.height,
    this.child,
    this.transparent = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: Image.asset(
            '$name',
            width: width,
            height: height,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              width: width,
              height: height,
              color: transparent ? Colors.transparent : Colors.grey[300],
              child: transparent
                  ? null
                  : Center(
                      child: Text(
                        name,
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(fontSize: 9, color: Colors.grey),
                      ),
                    ),
            ),
          ),
        ),
        if (child != null) Positioned.fill(child: child!),
      ],
    );
  }
}
