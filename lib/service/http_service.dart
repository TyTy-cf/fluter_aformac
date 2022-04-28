
import 'dart:_http';
import 'package:http/http.dart';
import 'package:http/io_client.dart';

class HttpService {

  static const String urlRaw = '';
  final http = IOClient(HttpClient());

  Future<Response> getRequest(String route, param) {
    Uri uri = Uri.https(HttpService.urlRaw, route);
    if (param != null) {
      uri = Uri.https(HttpService.urlRaw, route, param);
    }

    return http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
  }

  Future<Response> postRequest(String route, param) {
    return http.post(
      Uri.https(HttpService.urlRaw, route),
      body: param,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
  }

  Future putRequest(String route, param) {
    return http.put(
      Uri.https(HttpService.urlRaw, route),
      body: param,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
  }

}