import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';

class Require extends StatelessWidget {
  const Require({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      '*',
      style: TextStyle(
        fontSize: 18,
        color: ColorPalette.yellow,
      ),
    );
  }
}
