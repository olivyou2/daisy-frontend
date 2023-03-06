import 'package:http/http.dart' as http;

class Request {
  static String host = "http://localhost:3000";
  static Map<String, String> headers = {};

  static buildHeader(Map<String, String>? headers) {
    const Map<String, String> builtHeaders = {};
    builtHeaders.addAll(Request.headers);

    if (headers != null) {
      builtHeaders.addAll(headers);
    }

    return builtHeaders;
  }

  static get(String url, {Map<String, String>? headers}) {
    var builtHeaders = Request.buildHeader(headers);

    http.get(Uri.parse(host + url), headers: builtHeaders);
  }

  static post(String url, {Map<String, String>? headers}) {
    var builtHeaders = Request.buildHeader(headers);

    http.post(Uri.parse(host + url), headers: builtHeaders);
  }
}
