import 'package:flutter/cupertino.dart';

class CustomClipperBottomWidget extends CustomClipper<Path> {
  final Path originalPath;

  CustomClipperBottomWidget(this.originalPath);

  @override
  Path getClip(Size size) {
    final matrix =
        Matrix4.identity()..scale(size.width / 200, size.height / 200);
    return originalPath.transform(matrix.storage);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
