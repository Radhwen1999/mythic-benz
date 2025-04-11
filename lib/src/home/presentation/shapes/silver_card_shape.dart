import 'package:flutter/material.dart';

class TriangleBottomLeftClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 15;
    double triangleSize = 20;
    Path path = Path();
    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);
    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - radius,
      size.height,
    );
    path.lineTo(triangleSize, size.height);
    path.lineTo(0, size.height - triangleSize);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
