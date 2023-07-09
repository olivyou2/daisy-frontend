import 'dart:async';

import 'package:daisy_frontend/page/main/screens/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingPageWidget extends StatefulWidget {
  final PageNavigateController pageNavigateController;
  const SettingPageWidget({super.key, required this.pageNavigateController});

  @override
  State<SettingPageWidget> createState() => _SettingPageWidgetState();
}

class _SettingPageWidgetState extends State<SettingPageWidget> {
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
        decoration: const BoxDecoration(color: Color(0xffF5F5F5)),
      ),
    );
  }
}
