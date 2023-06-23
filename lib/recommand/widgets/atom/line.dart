import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 35),
      width: 1,
      height: 40,
      color: ColorPalette.gray2,
    );
  }
}
