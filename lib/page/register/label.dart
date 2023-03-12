import 'package:flutter/material.dart';
import 'package:daisy_frontend/util/color.dart';

class Label extends StatelessWidget {
  final String text;
  final bool required;

  const Label({super.key, required this.text, required this.required});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: ColorPalette.black,
          ),
          textAlign: TextAlign.left,
        ),
        const Text(
          '*',
          style: TextStyle(
            fontSize: 18,
            color: ColorPalette.yellow,
          ),
        )
      ],
    );
  }
}
