import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DaisyMap extends StatelessWidget {
  const DaisyMap({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 844.h - 58.h - 158.h,
      child: Stack(
        children: [
          const NaverMap(),
          Padding(
            padding: EdgeInsets.only(
              top: 628.h - 60.h - 64.h,
            ),
            child: Center(
              child: GestureDetector(
                onTapUp: onTabCreateMapBtn,
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorPalette.yello,
                      borderRadius: BorderRadius.all(Radius.circular(30.w))),
                  width: 259.w,
                  height: 60.h,
                  child: Center(
                    child: Text(
                      "데이트 지도 만들기",
                      style: TextStyle(
                          color: ColorPalette.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void onTabCreateMapBtn(details) {
    print("ㅎㅇ");
  }
}
