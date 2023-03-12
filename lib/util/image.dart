import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DaisyImages {
  static final googleBtnImage = SvgPicture.asset("assets/images/login/google.svg");
  static final kakaoBtnImage = SvgPicture.asset("assets/images/login/kakao.svg");
  static final naverBtnImage = SvgPicture.asset("assets/images/login/naver.svg");

  static const Image cameraBtnImage =
      Image(image: AssetImage("assets/images/init/camera.png"));
  static const AssetImage dropdownBtnImage =
      AssetImage("assets/images/init/dropdown.png");
}
