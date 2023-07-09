import 'package:flutter/material.dart';
import 'package:daisy_frontend/page/register/widgets/atom/camera_button.dart';
import 'package:daisy_frontend/util/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: CameraButton(handlePress: () => {}),
      ),
      Text(
        "사진 선택",
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: ColorPalette.gray,
        ),
      ),
    ]);
  }
}
