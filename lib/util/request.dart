import 'package:http/http.dart' as http;

class Request {
  static String host = "http://localhost:3000";
  static Map<String, String> headers = {};

  static buildUri(String url) {
    final builtUrl = host + url;

    return builtUrl;
  }

  static buildHeader(Map<String, String>? headers) {
    Map<String, String> builtHeaders = {};
    builtHeaders.addAll(Request.headers);

    if (headers != null) {
      builtHeaders.addAll(headers);
    }

    return builtHeaders;
  }

  static get(String url, {Map<String, String>? headers}) {
    final builtHeaders = Request.buildHeader(headers);
    final uri = Uri.parse(buildUri(url));

    return http.get(uri, headers: builtHeaders);
  }

  static post(String url, {Object? body, Map<String, String>? headers}) {
    final builtHeaders = Request.buildHeader(headers);
    final uri = Uri.parse(buildUri(url));

    return http.post(uri, headers: builtHeaders, body: body);
  }
}
