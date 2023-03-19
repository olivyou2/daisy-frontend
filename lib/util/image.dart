import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DaisyImages {
  static final googleBtnImage =
      SvgPicture.asset("assets/images/login/google.svg");
  static final googleClickedBtnImage =
      SvgPicture.asset("assets/images/login/clicked_google.svg");

  static final kakaoBtnImage =
      SvgPicture.asset("assets/images/login/kakao.svg");
  static final kakaoClickedBtnImage =
      SvgPicture.asset("assets/images/login/clicked_kakao.svg");

  static final naverBtnImage =
      SvgPicture.asset("assets/images/login/naver.svg");
  static final naverClickedBtnImage =
      SvgPicture.asset("assets/images/login/clicked_naver.svg");

  static final searchImage = SvgPicture.asset("assets/images/map/search.svg");
  static final deleteImage = SvgPicture.asset("assets/images/map/delete.svg");

  static const Image cameraBtnImage =
      Image(image: AssetImage("assets/images/init/camera.png"));
  static const AssetImage dropdownBtnImage =
      AssetImage("assets/images/init/dropdown.png");
}
