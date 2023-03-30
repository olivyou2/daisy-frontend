import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../util/color.dart';

class Indicator extends StatelessWidget {
  final List<Widget> children;
  const Indicator({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      height: 158.h,
      decoration: BoxDecoration(
          color: ColorPalette.white,
          boxShadow: const [
            BoxShadow(
                blurRadius: 6,
                spreadRadius: 6,
                color: Color.fromARGB(64, 198, 198, 198))
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.w), topRight: Radius.circular(30.w))),
      child: Column(children: [
        Padding(padding: EdgeInsets.only(top: 12.h)),
        SizedBox(
          width: 60.w,
          child: const Divider(
            height: 1,
            thickness: 4,
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 26.h)),
        ...children
      ]),
    );
  }
}
