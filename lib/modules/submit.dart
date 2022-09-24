import 'dart:convert';

SubmitStack submitStackFromJson(String str) =>
    SubmitStack.fromJson(json.decode(str));

String submitStackToJson(SubmitStack data) => json.encode(data.toJson());

class SubmitStack {
  SubmitStack({
    required this.message,
  });

  String message;

  factory SubmitStack.fromJson(Map<String, dynamic> json) => SubmitStack(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
