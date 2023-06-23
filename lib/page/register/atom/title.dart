import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';

class Title extends StatelessWidget {
  final String text;

  const Title({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: ColorPalette.black,
      ),
      textAlign: TextAlign.left,
    );
  }
}
