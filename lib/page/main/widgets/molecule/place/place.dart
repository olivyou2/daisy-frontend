import 'package:daisy_frontend/page/main/states/mapStates.dart';
import 'package:daisy_frontend/page/main/states/placeInfoStates.dart';
import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlaceWidget extends ConsumerStatefulWidget {
  final bool clickable;

  const PlaceWidget({Key? key, required this.clickable}) : super(key: key);

  @override
  ConsumerState<PlaceWidget> createState() => _PlaceWidgetState();
}

class _PlaceWidgetState extends ConsumerState<PlaceWidget> {
  onClick() {
    getMapStateProvider(ref).updateIsShowPlace(false);
  }

  @override
  Widget build(BuildContext context) {
    final placeStates = getPlaceInfoState(ref);

    return GestureDetector(
      onTapUp: (details) => onClick(),
      child: Container(
        width: 350.w,
        height: 168.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.w),
            color: ColorPalette.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ]),
        child: Center(
          child: SizedBox(
            width: 350.w - 24.w,
            height: 168.h - 36.h,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 130.w,
                    height: 130.h,
                    decoration: BoxDecoration(
                        color: ColorPalette.yellow,
                        borderRadius: BorderRadius.circular(14.sp)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 350.w - 24.w - 130.w - 22.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(placeStates.placeName,
                                    style: TextStyle(
                                        color: ColorPalette.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18.sp)),
                                Text("더보기",
                                    style: TextStyle(
                                        color: ColorPalette.gray2,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.sp)),
                              ],
                            ),
                          ),
                          Text(placeStates.time,
                              style: TextStyle(
                                  color: ColorPalette.gray3,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp)),
                          Text('${placeStates.rate}/5',
                              style: TextStyle(
                                  color: ColorPalette.darkGray,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp))
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.w),
                            color: widget.clickable
                                ? ColorPalette.yello
                                : ColorPalette.gray2),
                        width: 184.w,
                        height: 42.h,
                        child: Center(
                          child: Text(
                            "데이트장소 추가",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16.sp),
                          ),
                        ),
                      )
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
