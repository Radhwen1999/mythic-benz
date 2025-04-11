import 'package:flutter/cupertino.dart';

class CustomClipperTopWidget extends CustomClipper<Path> {
  final Path originalPath;

  CustomClipperTopWidget(this.originalPath);

  @override
  Path getClip(Size size) {
    final matrix =
        Matrix4.identity()..scale(size.width / 240, size.height / 43);
    return originalPath.transform(matrix.storage);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
