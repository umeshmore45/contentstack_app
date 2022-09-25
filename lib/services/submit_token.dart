import 'dart:convert';

import 'package:http/http.dart' as http;

Future<http.Response> submitTokenCall(Map<String, dynamic> data) {
  final res = http.post(
    Uri.parse(
        'https://562e-103-156-206-110.ngrok.io/?query=from-android-token'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json.encode(data),
  );
  return res;
}
