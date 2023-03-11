import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDivider extends StatelessWidget {
  final String title;

  const AppDivider({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 90.w,
          child: const Divider(
            color: ColorPalette.gray2,
            height: 1,
            thickness: 1,
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Text(title,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: "Pretendard",
                fontSize: 16.sp,
                color: ColorPalette.gray)),
        SizedBox(width: 8.w),
        SizedBox(
          width: 90.w,
          child: const Divider(
            color: ColorPalette.gray2,
            height: 1,
            thickness: 1,
          ),
        )
      ],
    );
  }
}
