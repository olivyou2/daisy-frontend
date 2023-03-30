import 'package:daisy_frontend/main/widgets/atom/button.dart';
import 'package:daisy_frontend/main/widgets/atom/indicator.dart';
import 'package:daisy_frontend/main/widgets/atom/placeInput.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../util/color.dart';

class MapTopIndicator extends StatelessWidget {
  const MapTopIndicator({
    super.key,
  });

  static const List<String> names = ["음식점", "카페", "공연", "노래방", "뭐시기", "저시기"];

  @override
  Widget build(BuildContext context) {
    return Indicator(children: [
      const PlaceInput(),
      Padding(padding: EdgeInsets.only(top: 16.h)),
      SizedBox(
        height: 36.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 26.w, right: 26.w),
          itemBuilder: (BuildContext context, int index) {
            return MapIndictaorButton(buttonName: MapTopIndicator.names[index]);
          },
          itemCount: 6,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 12.w,
            );
          },
        ),
      )
    ]);
  }
}
