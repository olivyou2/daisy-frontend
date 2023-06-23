import 'package:daisy_frontend/util/color.dart';
import 'package:daisy_frontend/util/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlaceInput extends StatefulWidget {
  const PlaceInput({super.key});

  @override
  State<PlaceInput> createState() => _PlaceInputState();
}

class _PlaceInputState extends State<PlaceInput> {
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      height: 52.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.w)),
          color: ColorPalette.backGray),
      child: Row(
        children: [
          Padding(padding: EdgeInsets.only(left: 4.w)),
          IconButton(
            icon: DaisyImages.searchImage,
            onPressed: () {},
          ),
          SizedBox(
            width: 240.w,
            child: const TextField(
              style: TextStyle(color: ColorPalette.gray),
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
          IconButton(onPressed: () {}, icon: DaisyImages.deleteImage)
        ],
      ),
    );
  }
}
