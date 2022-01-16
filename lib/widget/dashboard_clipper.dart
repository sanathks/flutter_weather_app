import 'dart:developer';

import 'package:flutter/material.dart';

class CurveClipper extends CustomClipper<Path> {
  final double shrink;

  CurveClipper({required this.shrink});

  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height -190);
    var firstStart = Offset(size.width - 150, size.height - 220);
    var firstEnd = Offset(size.width , (size.height) - (100 + shrink ));
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }

}