import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  String base_url = 'https://jsonplaceholder.typicode.com/';
  get(url) async {
    var response = await http.get(base_url + url);
    return jsonDecode(response.body);
  }

  post(String url, Map<String, dynamic> body) async {
    var response = await http.post(base_url + url, body: body);
    return jsonDecode(response.body);
  }
}
