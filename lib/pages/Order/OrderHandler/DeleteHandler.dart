import 'dart:convert';
import "package:http/http.dart" as http;
import "package:logger/logger.dart";

class DeleteHandler {
  String baseurl = "https://warm-ridge-34462.herokuapp.com";
  var log = Logger();

  dynamic deleteRequestVariable;

  Future get(String url) async {
    url = formater(url);
    var response = await http.get(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> huhu = json.decode(response.body);
      deleteRequestVariable = huhu["username"];
      if (huhu["msg"] == "success") {
        deleteRequestVariable = huhu["msg"];
      }
      return json.decode(response.body);
    }
  }

  Future delete(String url) async {
    url = formater(url);
    print("I am here");
    var response = await http.delete(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
  }

  String formater(String url) {
    return baseurl + url;
  }
}
