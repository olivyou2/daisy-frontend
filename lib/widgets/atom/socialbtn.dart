import 'package:daisy_frontend/util/request.dart';
import 'package:daisy_frontend/util/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

enum SocialType { kakao, naver, google }

class SocialBtn extends StatelessWidget {
  final Widget child;
  final SocialType type;

  const SocialBtn({super.key, required this.child, required this.type});

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
    return GestureDetector(onTap: () => onTapBtn(type), child: child);
  }
}
