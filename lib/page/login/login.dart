import 'package:daisy_frontend/util/color.dart';
import 'package:daisy_frontend/util/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 540.h,
            ),
            Row(
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
                Text("간편로그인",
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
            ),
            SizedBox(height: 50.h),
            SizedBox(
                width: 262,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("카카오");
                      },
                      child: DaisyImages.kakaoBtnImage,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("네이버");
                      },
                      child: DaisyImages.naverBtnImage,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("구글");
                      },
                      child: DaisyImages.googleBtnImage,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
