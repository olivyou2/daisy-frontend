import 'dart:convert';

import 'package:daisy_frontend/util/request.dart';
import 'package:daisy_frontend/util/storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class TokenManager {
  static late String? accessToken;
  static late String? refreshToken;

  static setAccessToken({required String accessToken}) {
    TokenManager.accessToken = accessToken;
  }

  static setRefreshToken({required String refreshToken}) {
    TokenManager.refreshToken = refreshToken;
  }

  static getAccessToken() {
    return TokenManager.accessToken;
  }

  static logout() {
    setAccessToken(accessToken: "");
    setRefreshToken(refreshToken: "");

    DeviceStorage.secureStorage.delete(key: "accessToken");
    DeviceStorage.secureStorage.delete(key: "refreshToken");
  }

  static Future<RefreshTokenResult> refreshAccessToken() async {
    final result = RefreshTokenResult();

    if (refreshToken == null) {
      result.success = false;
      result.refreshed = false;
      return result;
    }

    final payload = JwtDecoder.tryDecode(refreshToken!);

    if (payload == null) {
      result.success = false;
      result.refreshed = false;
      return result;
    }

    final expired = JwtDecoder.isExpired(accessToken!);

    if (expired == false) {
      result.success = true;
      result.refreshed = false;
      return result;
    }

    final body = {"refreshToken": refreshToken};

    final jsonBody = json.encode(body);

    final refreshResult = await Request.post("/client/refresh", body: jsonBody);

    final statusCode = refreshResult.statusCode;

    if (statusCode == 200) {
      final responseBody = refreshResult.body;
      final responseJsonBody = json.decode(responseBody);

      final refreshedAccessToken = responseJsonBody["accessToken"];

      result.refreshed = true;
      result.success = true;
      result.refreshedAccessToken = refreshedAccessToken;

      return result;
    } else {
      print("Error: " + statusCode.toString());

      result.refreshed = false;
      result.success = false;
      return result;
    }
  }
}

class RefreshTokenResult {
  late bool refreshed;
  late bool success;
  late String? refreshedAccessToken;
}
