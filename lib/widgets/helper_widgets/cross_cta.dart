import "package:aprreciate/core/themes/app_theme/AppColors.dart";
import "package:flutter/material.dart";

class CrossCta extends CustomPainter {

  @override
  void paint(Canvas canvas,Size size) {

    final paint = Paint()
        ..color = AppColors.crossCtaColor
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round;

    // diagonal 1
    canvas.drawLine(Offset(0,0), Offset(size.width, size.height), paint);

    // diagonal 2
    canvas.drawLine(Offset(0, size.height), Offset(size.width, 0), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}