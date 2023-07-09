import 'package:daisy_frontend/util/color.dart';
import 'package:daisy_frontend/util/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 399.w,
      height: 844.h,
      decoration: const BoxDecoration(color: ColorPalette.yello2),
      child: Stack(children: [
        Positioned(top: 245.h, left: 20.w, child: DaisyImages.splashLogoImage),
        Positioned(top: 377.h, left: 20.w, child: DaisyImages.splashDaisyImage),
        Positioned(
          top: 439.h,
          left: 20.w,
          child: Text(
            "우리의 데이트지도, 데이지",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
        ),
        Positioned(
            top: 453.h,
            left: 195.w,
            child: SizedBox(
                width: 175.w,
                child: const Divider(
                  color: Color.fromARGB(127, 255, 255, 255),
                  height: 1,
                  thickness: 1,
                )))
      ]),
    );
  }
}
