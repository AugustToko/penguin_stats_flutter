import 'dart:math';

import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {

  Paint painter = Paint()..color = Colors.black.withOpacity(0.05);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.rotate(pi / 180 * 45);
    canvas.save();
    for (int i = 0; i < 10; i++) {
      canvas.drawRect(Rect.fromCenter(center: Offset.zero, width: 32, height: 600), painter);
      canvas.translate(64, 0);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
