import 'package:flutter/material.dart';
import 'package:daisy_frontend/page/register/atom/camera_button.dart';
import 'package:daisy_frontend/util/color.dart';

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: CameraButton(handlePress: () => {}),
      ),
      const Text(
        "사진 선택",
        style: TextStyle(
          fontSize: 12,
          color: ColorPalette.gray2,
        ),
      ),
    ]);
  }
}
