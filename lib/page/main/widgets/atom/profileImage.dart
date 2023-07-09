import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
          color: ColorPalette.gray,
          borderRadius: BorderRadius.all(Radius.circular(20.w))),
    );
  }
}
