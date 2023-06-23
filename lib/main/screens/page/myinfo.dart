import 'package:daisy_frontend/main/screens/main.dart';
import 'package:daisy_frontend/util/color.dart';
import 'package:daisy_frontend/util/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyInfoPageWidget extends StatefulWidget {
  final PageNavigateController pageNavigateController;

  const MyInfoPageWidget({super.key, required this.pageNavigateController});

  @override
  State<MyInfoPageWidget> createState() => _MyInfoPageWidgetState();
}

class _MyInfoPageWidgetState extends State<MyInfoPageWidget> {
  closeCallback(details) {
    widget.pageNavigateController.pageClose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Text(
                  "내 정보 수정",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorPalette.gray3),
                )
              ],
            ),

            Padding(padding: EdgeInsets.only(top: 40.sp)),

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

            Padding(padding: EdgeInsets.only(top: 60.sp)),

            // 닉네임
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("닉네임",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: ColorPalette.black,
                        fontWeight: FontWeight.w700)),
                Padding(padding: EdgeInsets.only(top: 16.sp)),
                Text("김땡땡",
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: ColorPalette.gray3,
                        fontWeight: FontWeight.w500))
              ],
            ),

            Padding(padding: EdgeInsets.only(top: 12.sp)),

            const Divider(
              thickness: 1,
              color: ColorPalette.gray4,
            ),

            Padding(padding: EdgeInsets.only(top: 40.sp)),

            // 성별
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("성별",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: ColorPalette.black,
                        fontWeight: FontWeight.w700)),
                Padding(padding: EdgeInsets.only(top: 16.sp)),
                Text("남성",
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: ColorPalette.gray3,
                        fontWeight: FontWeight.w500))
              ],
            ),

            Padding(padding: EdgeInsets.only(top: 12.sp)),

            const Divider(
              thickness: 1,
              color: ColorPalette.gray4,
            ),

            Padding(padding: EdgeInsets.only(top: 40.sp)),

            // 거주지
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("거주지",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: ColorPalette.black,
                        fontWeight: FontWeight.w700)),
                Padding(padding: EdgeInsets.only(top: 16.sp)),
                Text("서울시 강남구",
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: ColorPalette.gray3,
                        fontWeight: FontWeight.w500))
              ],
            ),

            Padding(padding: EdgeInsets.only(top: 12.sp)),

            const Divider(
              thickness: 1,
              color: ColorPalette.gray4,
            ),

            Padding(padding: EdgeInsets.only(top: 40.sp)),

            // 생년월일
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("생년월일",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: ColorPalette.black,
                        fontWeight: FontWeight.w700)),
                Padding(padding: EdgeInsets.only(top: 16.sp)),
                Text("1999년 10월 15일",
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: ColorPalette.gray3,
                        fontWeight: FontWeight.w500))
              ],
            ),

            Padding(padding: EdgeInsets.only(top: 12.sp)),

            const Divider(
              thickness: 1,
              color: ColorPalette.gray4,
            ),

            Padding(padding: EdgeInsets.only(top: 40.sp)),
          ]),
        ),
      ),
    );
  }
}
