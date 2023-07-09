import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 0,
        fixedSize: const Size(260, 60),
        backgroundColor: ColorPalette.yello,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const Text(
        "데이트지도 만들기",
        style: TextStyle(
          fontSize: 20,
          color: ColorPalette.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
