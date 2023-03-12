import 'package:flutter/material.dart';
import 'package:daisy_frontend/page/register/camera_button.dart';
import 'package:daisy_frontend/util/color.dart';

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: CameraButton(handlePress: () => {}),
        margin: const EdgeInsets.only(bottom: 8),
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
