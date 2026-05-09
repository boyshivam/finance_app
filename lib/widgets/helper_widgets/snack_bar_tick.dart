import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";


class SnackBarTick extends CustomPainter {


  @override
  void paint(Canvas canvas, Size) {
    final paint = Paint()
        ..color = AppColorsCommon.snackBarMsgBlue
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round;

    // diagonal 1
    canvas.drawLine(Offset(0, 0), Offset(1, -1), paint);

    // diagonal 2
    canvas.drawLine(Offset(1, -1), Offset(4, 3), paint);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;


}