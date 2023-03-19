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
      child: const NaverMap(),
    );
  }
}
