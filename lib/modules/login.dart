// To parse this JSON data, do
//
//     final logInReturn = logInReturnFromJson(jsonString);

import 'dart:convert';

LogInReturn logInReturnFromJson(String str) {
  print('json decode ${jsonDecode(str)}');
  return LogInReturn.fromJson(jsonDecode(str));
}

Map<String, dynamic> logInReturnToJson(Map<String, dynamic> data) => data;

class LogInReturn {
  LogInReturn({
    required this.user,
  });

  List<User> user;

  factory LogInReturn.fromJson(Map<String, dynamic> json) => LogInReturn(
      // user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
      user: (json["user"] as List).map((e) => User.fromJson(e)).toList());

  Map<String, dynamic> toJson() => {
        "user": List<dynamic>.from(user.map((x) => x.toJson())),
      };
}

class User {
  User({
    required this.userUid,
    required this.firstName,
    required this.lastName,
    required this.authToken,
    required this.email,
    required this.selectedStacks,
    required this.stacks,
    required this.id,
  });

  String userUid;
  String firstName;
  String lastName;
  String authToken;
  String email;
  List<dynamic> selectedStacks;
  List<UserStack> stacks;
  String id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userUid: json["user_uid"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        authToken: json["auth_token"],
        email: json["email"],
        selectedStacks:
            List<dynamic>.from(json["selected_stacks"].map((x) => x)),
        stacks: List<UserStack>.from(
            json["stacks"].map((x) => UserStack.fromJson(x))),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user_uid": userUid,
        "first_name": firstName,
        "last_name": lastName,
        "auth_token": authToken,
        "email": email,
        "selected_stacks": List<dynamic>.from(selectedStacks.map((x) => x)),
        "stacks": List<dynamic>.from(stacks.map((x) => x.toJson())),
        "id": id,
      };
}

class UserStack {
  UserStack({
    required this.orgName,
    required this.orgUid,
    required this.stacks,
  });

  String orgName;
  String orgUid;
  List<StackStack> stacks;

  factory UserStack.fromJson(Map<String, dynamic> json) => UserStack(
        orgName: json["org_name"],
        orgUid: json["org_uid"],
        stacks: List<StackStack>.from(
            json["stacks"].map((x) => StackStack.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "org_name": orgName,
        "org_uid": orgUid,
        "stacks": List<dynamic>.from(stacks.map((x) => x.toJson())),
      };
}

class StackStack {
  StackStack({
    required this.stackName,
    required this.stackApiKey,
    required this.permissions,
  });

  String stackName;
  String stackApiKey;
  List<Permission> permissions;

  factory StackStack.fromJson(Map<String, dynamic> json) => StackStack(
        stackName: json["stack_name"],
        stackApiKey: json["stack_api_key"],
        permissions: List<Permission>.from(
            json["permissions"].map((x) => Permission.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "stack_name": stackName,
        "stack_api_key": stackApiKey,
        "permissions": List<dynamic>.from(permissions.map((x) => x.toJson())),
      };
}

class Permission {
  Permission({
    required this.type,
    required this.isEnabled,
  });

  String type;
  bool isEnabled;

  factory Permission.fromJson(Map<String, dynamic> json) => Permission(
        type: json["type"],
        isEnabled: json["isEnabled"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "isEnabled": isEnabled,
      };
}
