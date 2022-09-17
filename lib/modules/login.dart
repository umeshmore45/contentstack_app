// To parse this JSON data, do
//
//     final logIn = logInFromJson(jsonString);

import 'dart:convert';

LogIn logInFromJson(String str) => LogIn.fromJson(json.decode(str));

String logInToJson(LogIn data) => json.encode(data.toJson());

class LogIn {
  LogIn({
    this.success,
    this.lastName,
  });

  String? success;
  String? lastName;

  factory LogIn.fromJson(Map<String, dynamic> json) => LogIn(
        success: json["success"],
        lastName: json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "last_name": lastName,
      };
}
