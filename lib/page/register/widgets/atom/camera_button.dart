import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:daisy_frontend/util/color.dart';

class CameraButton extends StatelessWidget {
  final VoidCallback handlePress;

  const CameraButton({super.key, required this.handlePress});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: const ShapeDecoration(
        shape: CircleBorder(),
        color: ColorPalette.gray2,
      ),
      width: 100,
      height: 100,
      child: IconButton(
        onPressed: handlePress,
        icon: SvgPicture.asset(
          'assets/svgs/camera.svg',
        ),
      ),
    );
  }
}
