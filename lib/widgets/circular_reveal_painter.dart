import 'dart:math';
import 'package:flutter/material.dart';

class CircularRevealPainter extends CustomPainter {
  double fraction;
  Size screenSize;

  CircularRevealPainter({
    @required this.fraction,
    @required this.screenSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Color(0xFF403B58);

    double currentRadius = 24 + 800 * fraction;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), currentRadius, paint);
  }

  @override
  bool shouldRepaint(CircularRevealPainter oldDelegate) {
    return oldDelegate.fraction != fraction;
  }
}
