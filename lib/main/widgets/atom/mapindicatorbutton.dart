import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapIndictaorButton extends StatefulWidget {
  final String buttonName;

  const MapIndictaorButton({super.key, required this.buttonName});

  @override
  State<MapIndictaorButton> createState() => _MapIndictaorButtonState();
}

class _MapIndictaorButtonState extends State<MapIndictaorButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 87.w,
      height: 36.h,
      decoration: BoxDecoration(
          color: ColorPalette.white,
          border: Border.all(color: ColorPalette.gray2),
          borderRadius: BorderRadius.all(Radius.circular(20.w))),
      child: Center(
        child: Text(
          widget.buttonName,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15.sp,
              color: ColorPalette.gray),
        ),
      ),
    );
  }
}
