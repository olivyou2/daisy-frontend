import 'package:daisy_frontend/util/color.dart';
import 'package:daisy_frontend/util/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widget_mask/widget_mask.dart';

class WideDecoration extends StatefulWidget {
  const WideDecoration({super.key});

  @override
  State<WideDecoration> createState() => _WideDecorationState();
}

class _WideDecorationState extends State<WideDecoration> {
  final String title = "요즘 핫한 서울 전시 82곳";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 252.w,
      height: 160.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.w)),
      child: Stack(children: [
        Stack(children: [
          // Image Render
          Container(
            width: 252.w,
            height: 160.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.w)),
            ),
            child: const Image(
              image: DaisyImages.decorationMockImage,
              fit: BoxFit.fill,
            ),
          ),

          // Gradient Decoration
          Container(
            width: 252.w,
            height: 160.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.w)),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(0, 0, 0, 0),
                      Color.fromARGB(171, 131, 110, 214)
                    ])),
          ),

          // Text Overlay
          Container(
            padding: EdgeInsets.only(top: 124.h, left: 12.w),
            child: Text(
              title,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
            ),
          )
        ])
      ]),
    );
  }
}
