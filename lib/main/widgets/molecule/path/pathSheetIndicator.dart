import 'package:daisy_frontend/main/widgets/atom/indicator.dart';
import 'package:daisy_frontend/main/widgets/molecule/path/pathSheet.dart';
import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PathUnit extends StatefulWidget {
  const PathUnit({super.key});

  @override
  State<PathUnit> createState() => _PathUnitState();
}

class _PathUnitState extends State<PathUnit> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.w,
      height: 90.h,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                  color: ColorPalette.gray2,
                  borderRadius: BorderRadius.circular(25.w)),
            ),
            Padding(padding: EdgeInsets.only(left: 12.w)),
            Text("시작 장소를 선택해주세요",
                style: TextStyle(
                    color: ColorPalette.gray2,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500))
          ]),
    );
  }
}

class PathTopIndicator extends StatefulWidget {
  const PathTopIndicator({
    super.key,
  });

  @override
  State<PathTopIndicator> createState() => _PathTopIndicatorState();
}

class _PathTopIndicatorState extends State<PathTopIndicator> {
  int mode = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Indicator(height: 400.h, children: [
      SizedBox(
        width: 350.w,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(padding: EdgeInsets.only(top: 10.h)),
          Text(
            "2023 05/28 (일) 데이트 지도",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15.sp,
                color: Color.fromARGB(255, 242, 163, 9)),
          ),
          Padding(padding: EdgeInsets.only(top: 10.h)),
          PathUnit(),
          PathUnit(),
          PathUnit(),
          PathUnit(),
          PathUnit(),
        ]),
      )
    ]);
  }
}
