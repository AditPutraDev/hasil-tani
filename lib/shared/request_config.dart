import 'package:http/http.dart' as http;

const baseUrl = 'https://tanipedia.000webhostapp.com/';

class Request {
  String url;
  dynamic body;

  Request({required this.url, this.body});

  Future<http.Response> get() {
    return http.get(Uri.parse(baseUrl + url));
  }

  Future<http.Response> post() {
    return http.post(Uri.parse(baseUrl + url), body: body);
  }
}
