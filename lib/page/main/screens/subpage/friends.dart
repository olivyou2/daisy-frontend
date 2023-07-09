import 'dart:async';

import 'package:daisy_frontend/page/main/screens/main.dart';
import 'package:daisy_frontend/util/color.dart';
import 'package:daisy_frontend/util/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FriendPageWidget extends StatefulWidget {
  final PageNavigateController pageNavigateController;

  const FriendPageWidget({super.key, required this.pageNavigateController});

  @override
  State<FriendPageWidget> createState() => _FriendPageWidgetState();
}

class _FriendPageWidgetState extends State<FriendPageWidget> {
  bool friendConnected = true;
  String myName = "박원호";
  String friendName = "박진아";

  _renderIcon() {
    if (friendConnected) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                    color: ColorPalette.yello,
                    borderRadius: BorderRadius.circular(40.w)),
              ),
              Padding(padding: EdgeInsets.only(top: 8.sp)),
              Text(myName,
                  style: TextStyle(
                      color: ColorPalette.gray3,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700))
            ],
          ),
          Padding(padding: EdgeInsets.only(left: 14.w)),
          SizedBox(
            height: 38.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DaisyImages.pageFriendRelateImage,
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 14.w)),
          Column(
            children: [
              Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                    color: ColorPalette.yello,
                    borderRadius: BorderRadius.circular(40.w)),
              ),
              Padding(padding: EdgeInsets.only(top: 8.sp)),
              Text(friendName,
                  style: TextStyle(
                      color: ColorPalette.gray3,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700))
            ],
          ),
        ],
      );
    }

    return Column(children: [
      // 프로필 이미지
      SizedBox(
        width: 350.w,
        child: Center(
          child: Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
                color: ColorPalette.yello,
                borderRadius: BorderRadius.circular(50.w)),
          ),
        ),
      ),

      Padding(padding: EdgeInsets.only(top: 12.h)),

      SizedBox(
        width: 350.w,
        child: Center(
          child: Text(
            myName,
            style: TextStyle(
                color: ColorPalette.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    ]);
  }

  _renderBtn() {
    if (friendConnected) {
      return Text("친구 등록 해제",
          style: TextStyle(
              color: ColorPalette.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700));
    }

    return Row(
      children: [
        DaisyImages.pageFriendKakaoImage,
        Padding(padding: EdgeInsets.only(left: 12.w)),
        Text(
          "카카오톡으로 친구 등록",
          style: TextStyle(
              color: ColorPalette.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700),
        )
      ],
    );
  }

  _renderDescription() {
    if (friendConnected) {
      return SizedBox();
    }

    return SizedBox(
      width: 350.w,
      child: Center(
        child: Text("등록된 친구가 없습니다",
            style: TextStyle(
                color: ColorPalette.gray,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500)),
      ),
    );
  }

  bool animation = false;
  bool close = false;

  final bool closeAnimationMode = true;

  closeCallback(details) {
    if (!closeAnimationMode) {
      widget.pageNavigateController.pageClose();
    }

    if (closeAnimationMode) {
      setState(() {
        close = true;
        animation = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    Timer.run(
      () {
        setState(() {
          animation = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOutCirc,
      right: animation ? 0 : -390.w,
      onEnd: () {
        if (close) {
          setState(() {
            widget.pageNavigateController.pageClose();
          });
        }
      },
      child: Container(
        width: 390.w,
        height: 844.h,
        decoration: const BoxDecoration(color: ColorPalette.white),
        child: Center(
          child: SizedBox(
            width: 350.w,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(padding: EdgeInsets.only(top: 83.h)),

              // 상단 인디케이터
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTapUp: closeCallback, child: DaisyImages.menuPrevImage),
                ],
              ),

              Padding(padding: EdgeInsets.only(top: 40.sp)),

              _renderIcon(),

              Padding(padding: EdgeInsets.only(top: 40.sp)),

              const Divider(
                thickness: 1,
                height: 1,
                color: ColorPalette.gray4,
              ),
              Padding(padding: EdgeInsets.only(top: 28.sp)),

              _renderBtn(),

              Padding(padding: EdgeInsets.only(top: 28.sp)),

              const Divider(
                thickness: 1,
                height: 1,
                color: ColorPalette.gray4,
              ),

              Padding(padding: EdgeInsets.only(top: 355.sp)),

              _renderDescription()
            ]),
          ),
        ),
      ),
    );
  }
}
