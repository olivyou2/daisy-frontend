import 'dart:ffi';

import 'package:daisy_frontend/util/color.dart';
import 'package:daisy_frontend/util/request.dart';
import 'package:daisy_frontend/util/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

enum SocialType { kakao, naver, google }

class SocialBtn extends StatefulWidget {
  final Widget child;
  final SocialType type;
  late Color background;
  late bool outlined;

  SocialBtn({super.key, required this.child, required this.type}) {
    outlined = false;

    if (type == SocialType.kakao) {
      background = const Color(0xffffe800);
    } else if (type == SocialType.naver) {
      background = const Color(0xff00D134);
    } else if (type == SocialType.google) {
      background = const Color(0xffffffff);
      outlined = true;
    }
  }

  @override
  State<StatefulWidget> createState() => SocialBtnState();
}

class SocialBtnState extends State<SocialBtn> {
  onTapBtn(SocialType type) async {
    var socialType = "";

    if (type == SocialType.kakao) {
      socialType = "kakao";
    } else if (type == SocialType.google) {
      socialType = "google";
    } else if (type == SocialType.naver) {
      socialType = "naver";
    }

    final uri = Request.buildUri("/client/$socialType");

    final res = await FlutterWebAuth2.authenticate(
        url: uri, callbackUrlScheme: "daisy-app");

    final accessToken = Uri.parse(res).queryParameters["access"];
    final refreshToken = Uri.parse(res).queryParameters["refresh"];

    DeviceStorage.secureStorage.write(key: "accessToken", value: accessToken);
    DeviceStorage.secureStorage.write(key: "refreshToken", value: refreshToken);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74.w,
      height: 74.h,
      decoration: BoxDecoration(
          color: widget.background,
          borderRadius: BorderRadius.all(Radius.circular(37.w)),
          border:
              widget.outlined ? Border.all(color: ColorPalette.gray2) : null),
      child: IconButton(
        icon: widget.child,
        onPressed: () {
          onTapBtn(widget.type);
        },
      ),
    );
  }
}
