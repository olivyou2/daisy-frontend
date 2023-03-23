import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainDescription extends StatefulWidget {
  const MainDescription({super.key});

  @override
  State<MainDescription> createState() => _MainDescriptionState();
}

class _MainDescriptionState extends State<MainDescription> {
  String name = "김땡땡";

  @override
  Widget build(BuildContext context) {
    return Text(
      "$name님,\n이번 데이트는 어디가 좋을까요?",
      style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
          color: ColorPalette.darkGray),
    );
  }
}
