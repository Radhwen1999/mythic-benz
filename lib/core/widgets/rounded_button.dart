import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.text,
    super.key,
    this.onPressed,
    this.height,
    this.padding,
    this.textStyle,
    this.backgroundColour,
  });

  final VoidCallback? onPressed;
  final String text;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final Color? backgroundColour;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(10, 30),
            blurRadius: 20,
            spreadRadius: 1,
          ),
        ],
      ),
      child: SizedBox(
        height: height ?? 55,
        width: 300,
        child: FilledButton(
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            backgroundColor: backgroundColour,
            padding: padding,
            elevation: 0,
          ),
          onPressed: () {
            FocusManager.instance.primaryFocus?.unfocus();
            onPressed?.call();
          },
          child: Text(
            text,
            style:
                textStyle ??
                const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
          ),
        ),
      ),
    );
  }
}
