import 'dart:convert';

import 'package:http/http.dart' as http;

Future<http.Response> logInCall(String email, String password) {
  final res = http.post(
    Uri.parse('https://8702-103-156-206-110.ngrok.io/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json.encode({"email": email, "password": password}),
  );
  return res;
}
