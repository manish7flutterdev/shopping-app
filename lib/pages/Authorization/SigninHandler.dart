import 'dart:convert';
import "package:http/http.dart" as http;
import "package:logger/logger.dart";

class SigninHandler {
  String baseurl = "https://nameless-crag-50769.herokuapp.com";
  var log = Logger();

  Future get(String url) async {
    url = formater(url);
    var response = await http.get(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    }
  }

  Future<dynamic> post(String url, Map<String, String> body) async {
    url = formater(url);
    var response = await http.post(
      url,
      headers: {"Content-type": "application/json"},
      body: json.encode(body),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    }
  }

  String formater(String url) {
    return baseurl + url;
  }
}
