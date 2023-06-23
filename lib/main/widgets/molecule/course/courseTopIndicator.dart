import 'dart:async';

import 'package:daisy_frontend/main/widgets/atom/indicator.dart';
import 'package:daisy_frontend/main/widgets/atom/placeInput.dart';
import 'package:daisy_frontend/main/widgets/molecule/course/courseSheet.dart';
import 'package:daisy_frontend/main/widgets/molecule/map/mapSheet.dart';
import 'package:daisy_frontend/util/color.dart';
import 'package:daisy_frontend/util/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseButtonController extends ChangeNotifier {
  int selectedIndex = -1;

  select(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}

class CourseButton extends StatefulWidget {
  final String text;
  final CourseButtonController controller;
  final int index;

  const CourseButton(
      {super.key,
      required this.text,
      required this.controller,
      required this.index});

  @override
  State<CourseButton> createState() => _CourseButtonState();
}

class _CourseButtonState extends State<CourseButton> {
  bool clicked = false;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      setState(() {
        clicked = widget.index == widget.controller.selectedIndex;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        setState(() {
          // clicked = !clicked;
          widget.controller.select(widget.index);
        });
      },
      child: Container(
        // set align to center
        alignment: Alignment.center,
        // width: 74.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: ColorPalette.white,
          border: Border.all(
            color: clicked ? ColorPalette.gray3 : ColorPalette.gray2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(24.w)),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 26.w, right: 26.w),
          child: Text(
            widget.text,
            style: TextStyle(
                color: clicked ? ColorPalette.gray3 : ColorPalette.gray2,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

class CourseTopIndicator extends StatefulWidget {
  final CourseSheetController sheetController;
  final MapMenuController mapMenuController;

  const CourseTopIndicator({
    super.key,
    required this.sheetController,
    required this.mapMenuController,
  });

  @override
  State<CourseTopIndicator> createState() => _CourseTopIndicatorState();
}

class _CourseTopIndicatorState extends State<CourseTopIndicator> {
  int mode = 0;

  final CourseButtonController buttonController = CourseButtonController();

  Widget buildPrompt(BuildContext context) {
    return SizedBox(
      width: 350.w,
      child: Column(children: [
        Padding(padding: EdgeInsets.only(top: 16.h)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: 296.w,
                child: TextField(
                  // set hint text
                  style: TextStyle(
                      color: ColorPalette.gray3,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    hintText: "어떤 기념일인가요?",
                    hintStyle: TextStyle(
                        color: ColorPalette.gray2,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                    border: InputBorder.none,
                  ),
                )),
            Text("0/15")
          ],
        ),
        Divider(
          height: 1.h,
          color: ColorPalette.gray2,
        ),
      ]),
    );
  }

  @override
  void initState() {
    super.initState();

    buttonController.addListener(() {
      if (buttonController.selectedIndex == 0) {
        setState(() {
          mode = 1;
          widget.sheetController.setHeight(460.h);
        });
      } else {
        setState(() {
          mode = 0;
          widget.sheetController.setHeight(400.h);
        });
      }

      Timer(const Duration(milliseconds: 500), () {
        widget.sheetController.open();
      });
    });
  }

  final List<String> menu = ["일상 데이트", "기념일"];

  changeMenu() {
    widget.mapMenuController.setMenu(1);
  }

  @override
  Widget build(BuildContext context) {
    return Indicator(height: mode == 0 ? 400.h : 460.h, children: [
      SizedBox(
        width: 350.w,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(padding: EdgeInsets.only(top: 14.h)),
          Text(
            "데이트 날짜를 입력해주세요",
            style: TextStyle(
                fontSize: 18.sp,
                color: ColorPalette.black,
                fontWeight: FontWeight.w700),
          ),
          Padding(padding: EdgeInsets.only(top: 16.h)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "언제 만나시나요?",
                style: TextStyle(color: ColorPalette.gray2),
              ),
              Image(
                image: DaisyImages.dropdownBtnImage,
                width: 18.w,
                height: 36.h,
                color: ColorPalette.gray,
              )
            ],
          ),
          Divider(
            height: 1.h,
            color: ColorPalette.gray2,
          ),
          Padding(padding: EdgeInsets.only(top: 40.h)),
          Text("이 날은",
              style: TextStyle(
                  fontSize: 18.sp,
                  color: ColorPalette.black,
                  fontWeight: FontWeight.w700)),
          Padding(padding: EdgeInsets.only(top: 16.h)),
          SizedBox(
            width: 350.w,
            height: 40.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              // padding: EdgeInsets.only(left: 26.w, right: 26.w),
              itemBuilder: (BuildContext context, int index) {
                return CourseButton(
                  text: menu[index],
                  controller: buttonController,
                  index: index,
                );
              },
              itemCount: menu.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 12.w,
                );
              },
            ),
          ),
          SizedBox(
            width: 350.w,
            child: mode == 0 ? null : buildPrompt(context),
          ),
          Padding(padding: EdgeInsets.only(top: 40.h)),
          GestureDetector(
            onTapDown: (details) {
              changeMenu();
            },
            child: Container(
              width: 350.w,
              alignment: Alignment.center,
              child: Container(
                width: 186.w,
                height: 60.h,
                decoration: BoxDecoration(
                    color: ColorPalette.yello,
                    borderRadius: BorderRadius.all(Radius.circular(30.w))),
                alignment: Alignment.center,
                child: Text(
                  "다음으로",
                  style: TextStyle(
                      color: ColorPalette.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          )
        ]),
      )
    ]);
  }
}
