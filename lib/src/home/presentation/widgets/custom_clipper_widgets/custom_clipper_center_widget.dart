import 'package:flutter/cupertino.dart';

class CustomClipperCenterWidget extends CustomClipper<Path> {
  final Path originalPath;

  CustomClipperCenterWidget(this.originalPath);

  @override
  Path getClip(Size size) {
    final matrix =
        Matrix4.identity()..scale(size.width / 286, size.height / 255);
    return originalPath.transform(matrix.storage);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
