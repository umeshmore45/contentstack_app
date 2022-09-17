import 'dart:convert';

import 'package:http/http.dart' as http;

Future<http.Response> logInCall(String email, String password) {
  var res = http.post(
    Uri.parse('https://hookb.in/Oempea2nVLhq0lmqkMWj'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json.encode({"email": email, "password": password}),
  );
  print(res);
  return res;
}
