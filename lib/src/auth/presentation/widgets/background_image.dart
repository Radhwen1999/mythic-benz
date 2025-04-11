import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Image.asset(
        'assets/images/car.jpg',
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
        width: double.infinity,
      ),
    );
  }
}
