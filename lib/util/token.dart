import 'package:daisy_frontend/util/request.dart';

class TokenManager {
  static late final String? accessToken;
  static late final String? refreshToken;

  setAccessToken({required String accessToken}) {
    TokenManager.accessToken = accessToken;
  }

  setRefreshToken({required String refreshToken}) {
    TokenManager.refreshToken = refreshToken;
  }

  refreshAccessToken() async {
    // TODO: access token refresh logic
  }
}
