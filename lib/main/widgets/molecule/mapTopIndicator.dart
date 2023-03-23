import 'package:daisy_frontend/main/widgets/atom/button.dart';
import 'package:daisy_frontend/main/widgets/atom/placeInput.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../util/color.dart';

class TopIndicator extends StatelessWidget {
  const TopIndicator({
    super.key,
  });

  static const List<String> names = ["음식점", "카페", "공연", "노래방", "뭐시기", "저시기"];

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
        const PlaceInput(),
        Padding(padding: EdgeInsets.only(top: 16.h)),
        SizedBox(
          height: 36.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 26.w, right: 26.w),
            itemBuilder: (BuildContext context, int index) {
              return MapIndictaorButton(buttonName: TopIndicator.names[index]);
            },
            itemCount: 6,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 12.w,
              );
            },
          ),
        )
      ]),
    );
  }
}
