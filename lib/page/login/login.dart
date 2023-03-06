import 'package:daisy_frontend/util/color.dart';
import 'package:daisy_frontend/util/image.dart';
import 'package:daisy_frontend/util/storage.dart';
import 'package:daisy_frontend/widgets/atom/socialbtn.dart';
import 'package:daisy_frontend/widgets/molecule/dividier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key}) {
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

        // TODO: goto main page because already logged in
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 540.h,
            ),
            const AppDivider(title: "간편로그인"),
            SizedBox(height: 50.h),
            SizedBox(
                width: 262,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
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
      ),
    );
  }
}
