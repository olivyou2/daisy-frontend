import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Require extends StatelessWidget {
  const Require({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '*',
      style: TextStyle(
        fontSize: 18.sp,
        color: ColorPalette.yello2,
      ),
    );
  }
}
