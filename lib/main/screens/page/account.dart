import 'package:daisy_frontend/main/screens/main.dart';
import 'package:daisy_frontend/util/color.dart';
import 'package:daisy_frontend/util/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountPageWidget extends StatefulWidget {
  final PageNavigateController pageNavigateController;

  const AccountPageWidget({super.key, required this.pageNavigateController});

  @override
  State<AccountPageWidget> createState() => _AccountPageWidgetState();
}

class _AccountPageWidgetState extends State<AccountPageWidget> {
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

            Padding(padding: EdgeInsets.only(top: 12.sp)),

            SizedBox(
              width: 350.w,
              child: Center(
                child: Text("김땡땡",
                    //700, 16, black
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorPalette.black)),
              ),
            ),

            Padding(padding: EdgeInsets.only(top: 40.sp)),

            // 닉네임
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("연결된 계정",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: ColorPalette.black,
                            fontWeight: FontWeight.w700)),
                    Row(
                      children: [
                        DaisyImages.pageFriendKakaoImage,
                        Padding(padding: EdgeInsets.only(left: 8.w)),
                        Text("카카오",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: ColorPalette.gray3,
                                fontWeight: FontWeight.w500))
                      ],
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 8.h)),
                Text("toolscomfact@gmail.com",
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: ColorPalette.gray3,
                        fontWeight: FontWeight.w500))
              ],
            ),

            Padding(padding: EdgeInsets.only(top: 14.h)),

            const Divider(
              thickness: 1,
              color: ColorPalette.gray4,
            ),

            Padding(padding: EdgeInsets.only(top: 28.h)),

            Text(
              "로그아웃",
              //700, 18, black
              style: TextStyle(
                  fontSize: 18.sp,
                  color: ColorPalette.black,
                  fontWeight: FontWeight.w700),
            ),
            Padding(padding: EdgeInsets.only(top: 28.h)),
            const Divider(
              thickness: 1,
              color: ColorPalette.gray4,
            ),

            Padding(padding: EdgeInsets.only(top: 28.h)),

            Text(
              "서비스 탈퇴",
              //700, 18, black
              style: TextStyle(
                  fontSize: 18.sp,
                  color: ColorPalette.black,
                  fontWeight: FontWeight.w700),
            ),
            Padding(padding: EdgeInsets.only(top: 28.h)),
            const Divider(
              thickness: 1,
              color: ColorPalette.gray4,
            ),
          ]),
        ),
      ),
    );
  }
}
