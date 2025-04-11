import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mythic_benz/core/res/Media/media.dart';

class MainBgScreenGlassmorphism extends StatelessWidget {
  const MainBgScreenGlassmorphism({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            Media.carBackgroundImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.black.withOpacity(0.2)),
          ),
        ],
      ),
    );
  }
}
