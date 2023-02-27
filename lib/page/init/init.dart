import 'package:daisy_frontend/util/color.dart';
import 'package:daisy_frontend/util/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  final String nickname = "";
  final String gender = "";
  final String place = "";
  final String birth = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SizedBox.expand(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 104.h,
          ),

          // 카메라 선택부
          DaisyImages.cameraBtnImage,

          SizedBox(height: 8.h),

          // 사진 선택
          Text(
            "사진 선택",
            style: TextStyle(
                color: ColorPalette.gray,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp),
          ),

          SizedBox(height: 32.h),

          // 닉네임
          SizedBox(
              width: 350.w,
              child: Column(
                children: [
                  // Text: 닉네임*
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '닉네임',
                        style: TextStyle(
                            color: ColorPalette.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp),
                      ),
                      Text(
                        '*',
                        style: TextStyle(
                            color: ColorPalette.yellow,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp),
                      )
                    ],
                  ),

                  // TextField: 이름을 입력해주세요 + TextField: 0/15
                  Row(
                    children: [
                      SizedBox(
                          width: 296.w,
                          child: TextField(
                            style: const TextStyle(
                                color: ColorPalette.gray3,
                                fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: ColorPalette.gray,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp),
                                hintText: "이름을 입력해주세요"),
                          )),
                      SizedBox(
                        width: 34.w,
                        child: Text("0/15",
                            style: TextStyle(
                                color: ColorPalette.gray2,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp)),
                      ),
                    ],
                  ),

                  // Horizontal Divider
                  SizedBox(
                      width: 350.w,
                      child: const Divider(
                        color: ColorPalette.gray2,
                        height: 1,
                        thickness: 1,
                      ))
                ],
              )),

          SizedBox(height: 40.h),

          // 성별
          SizedBox(
              width: 350.w,
              child: Column(
                children: [
                  //Text: 성별*
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '성별',
                        style: TextStyle(
                            color: ColorPalette.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp),
                      ),
                      Text(
                        '*',
                        style: TextStyle(
                            color: ColorPalette.yellow,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp),
                      )
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 80.w,
                        height: 40.h,
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                      side: const BorderSide(
                                          color: ColorPalette.gray2)))),
                          child: Text(
                            "남성",
                            style: TextStyle(
                                color: ColorPalette.gray2,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      SizedBox(
                        width: 80.w,
                        height: 40.h,
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                      side: const BorderSide(
                                          color: ColorPalette.gray2)))),
                          child: Text(
                            "여성",
                            style: TextStyle(
                                color: ColorPalette.gray2,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),

          SizedBox(
            height: 40.h,
          ),

          SizedBox(
              width: 350.w,
              child: Column(
                children: [
                  // 거주지*
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '거주',
                        style: TextStyle(
                            color: ColorPalette.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp),
                      ),
                      Text(
                        '*',
                        style: TextStyle(
                            color: ColorPalette.yellow,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp),
                      )
                    ],
                  ),
                  SizedBox(height: 16.h),
                  // TextField, DropDownBtn
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 296.w,
                          child: TextField(
                            style: const TextStyle(
                                color: ColorPalette.gray3,
                                fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: ColorPalette.gray,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp),
                                hintText: "거주지를 선택해주세요"),
                          )),
                      Image(
                          image: DaisyImages.dropdownBtnImage,
                          width: 7.w,
                          height: 14.h)
                    ],
                  ),

                  // Horizontal Divider
                  SizedBox(
                      width: 350.w,
                      child: const Divider(
                        color: ColorPalette.gray2,
                        height: 1,
                        thickness: 1,
                      ))
                ],
              )),
        ]),
      ),
    );
  }
}
