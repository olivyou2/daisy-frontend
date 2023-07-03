import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  static final closeImage = SvgPicture.asset("assets/images/main/del.svg");
  static final menuGotoImage =
      SvgPicture.asset("assets/images/main/menu_goto.svg");
  static final menuPrevImage =
      SvgPicture.asset("assets/images/main/menu_prev.svg");

  static final pageFriendKakaoImage =
      SvgPicture.asset("assets/images/pages/friend/kakao.svg");
  static final pageFriendRelateImage =
      SvgPicture.asset("assets/images/pages/friend/relate.svg");

  static final bellImage = SvgPicture.asset("assets/images/main/bell.svg");
  static final burgerImage = SvgPicture.asset("assets/images/main/burger.svg");

  static const bookMarkerImage =
      AssetImage("assets/images/map/book_marker.png");
  static const cultureMarkerImage =
      AssetImage("assets/images/map/culture_marker.png");
  static const foodMarkerImage =
      AssetImage("assets/images/map/food_marker.png");

  static const Image cameraBtnImage =
      Image(image: AssetImage("assets/images/init/camera.png"));
  static const AssetImage dropdownBtnImage =
      AssetImage("assets/images/init/dropdown.png");

  // MOCKUP DATA

  static const AssetImage decorationMockImage =
      AssetImage("assets/images/mock/decoration.png");
}
