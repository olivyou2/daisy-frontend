import 'package:http/http.dart' as http;

class Request {
  static String host = "http://localhost:3000";
  static Map<String, String> headers = {"Content-Type": "application/json"};

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

  static Future<http.Response> get(String url,
      {Map<String, String>? headers}) async {
    final builtHeaders = Request.buildHeader(headers);
    final uri = Uri.parse(buildUri(url));

    final result = await http.get(uri, headers: builtHeaders);
    return result;
  }

  static Future<http.Response> post(String url,
      {Object? body, Map<String, String>? headers}) async {
    final builtHeaders = Request.buildHeader(headers);
    final uri = Uri.parse(buildUri(url));

    return await http.post(uri, headers: builtHeaders, body: body);
  }
}
