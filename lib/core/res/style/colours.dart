import 'package:flutter/material.dart';

abstract class Colours {
  static const Color primaryPinkColor = Color(0xffC30273);
  static const Color lightGreyTintColor = Color(0xffd7d7d7);
  static const Color smallButtonHomePageColor = Color(0xff2A2630);
  static const Gradient gradientSilverGreyColor = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Colors.black, Color(0xFF39373A)],
  );
}
