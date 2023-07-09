import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainDescription extends StatefulWidget {
  late String name;
  late String description;

  MainDescription({super.key, required this.name, required this.description});

  @override
  State<MainDescription> createState() => _MainDescriptionState();
}

class _MainDescriptionState extends State<MainDescription> {
  @override
  Widget build(BuildContext context) {
    String modifiedDescription =
        widget.description.replaceAll(RegExp("{name}"), widget.name);

    return Text(
      modifiedDescription,
      style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
          color: ColorPalette.darkGray),
    );
  }
}
