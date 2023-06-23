import 'package:daisy_frontend/main/screens/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingPageWidget extends StatefulWidget {
  final PageNavigateController pageNavigateController;
  const SettingPageWidget({super.key, required this.pageNavigateController});

  @override
  State<SettingPageWidget> createState() => _SettingPageWidgetState();
}

class _SettingPageWidgetState extends State<SettingPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      height: 844.h,
      decoration: const BoxDecoration(color: Color(0xffF5F5F5)),
    );
  }
}
