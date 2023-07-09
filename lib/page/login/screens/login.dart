import 'dart:async';

import 'package:daisy_frontend/page/login/widgets/atom/dividier.dart';
import 'package:daisy_frontend/page/login/widgets/atom/socialbtn.dart';
import 'package:daisy_frontend/page/login/widgets/atom/splash.dart';
import 'package:daisy_frontend/page/pageStates.dart';
import 'package:daisy_frontend/util/color.dart';
import 'package:daisy_frontend/util/image.dart';
import 'package:daisy_frontend/util/storage.dart';
import 'package:daisy_frontend/util/token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  LoginPage({super.key}) {}

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  double opacity = 1;
  bool splashDone = false;

  @override
  void initState() {
    super.initState();

    // Automatic Login
    DeviceStorage.loadData((timestamp, storage) async {
      final isLoginHistoryExists =
          await storage.containsKey(key: "accessToken") &&
              await storage.containsKey(key: "refreshToken");

      if (isLoginHistoryExists) {
        final accessToken = await storage.read(key: "accessToken");
        final refreshToken = await storage.read(key: "refreshToken");

        if (accessToken == null) {
          return;
        }

        if (refreshToken == null) {
          return;
        }

        TokenManager.setAccessToken(accessToken: accessToken);
        TokenManager.setRefreshToken(refreshToken: refreshToken);

        RefreshTokenResult refreshResult =
            await TokenManager.refreshAccessToken();

        if (refreshResult.refreshed) {
          TokenManager.setAccessToken(
              accessToken: refreshResult.refreshedAccessToken!);
          await storage.write(
              key: "accessToken", value: TokenManager.getAccessToken());
        }

        // TODO: goto main page because already logged in
        getPageStateProvider(ref).updatePage(PageState.main);
      }
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        opacity = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: 218.h,
              left: 38.w,
              child: DaisyImages.loginLogoImage,
            ),
            Positioned(
              top: 336.h,
              child: SizedBox(
                width: 390.w,
                child: Center(
                    child: Column(
                  children: [
                    Text(
                      "데이지에서 쉽게\n데이트코스를 짜보세요!",
                      style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: ColorPalette.gray3),
                      textAlign: TextAlign.center,
                    ),
                    Padding(padding: EdgeInsets.only(top: 2.h)),
                    Text(
                      "데이트코스 추천부터 기록까지",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.gray2),
                    )
                  ],
                )),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 540.h,
                ),
                const AppDivider(title: "간편로그인"),
                SizedBox(height: 50.h),
                SizedBox(
                    width: 262.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SocialBtn(
                          type: SocialType.kakao,
                          child: DaisyImages.kakaoBtnImage,
                        ),
                        SocialBtn(
                          type: SocialType.naver,
                          child: DaisyImages.naverBtnImage,
                        ),
                        SocialBtn(
                          type: SocialType.google,
                          child: DaisyImages.googleBtnImage,
                        ),
                      ],
                    ))
              ],
            ),
            !splashDone
                ? AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: opacity,
                    curve: Curves.linear,
                    child: const Splash(),
                    onEnd: () {
                      setState(() {
                        splashDone = true;
                      });
                    })
                : Container(),
          ],
        ),
      ),
    );
  }
}
