import 'package:daisy_frontend/page/pageStates.dart';
import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StartButton extends ConsumerStatefulWidget {
  const StartButton({super.key});

  @override
  ConsumerState<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends ConsumerState<StartButton> {
  onClickStart() {
    getPageStateProvider(ref).updatePage(PageState.main);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClickStart(),
      child: Container(
        width: 242.w,
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: ColorPalette.yello,
        ),
        child: Center(
            child: Text(
          "데이지 시작하기",
          style: TextStyle(
            color: ColorPalette.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        )),
      ),
    );
  }
}
