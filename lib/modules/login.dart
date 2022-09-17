// To parse this JSON data, do
//
//     final logInReturn = logInReturnFromJson(jsonString);

import 'dart:convert';

LogInReturn logInReturnFromJson(String str) =>
    LogInReturn.fromJson(json.decode(str));

String logInReturnToJson(LogInReturn data) => json.encode(data.toJson());

class LogInReturn {
  LogInReturn({
    required this.firstName,
    required this.lastName,
    required this.userUid,
    required this.stacks,
    required this.selectedStacks,
    required this.selectedOrgs,
  });

  String firstName;
  String lastName;
  String userUid;
  List<LogInReturnStack> stacks;
  List<dynamic> selectedStacks;
  List<dynamic> selectedOrgs;

  factory LogInReturn.fromJson(Map<String, dynamic> json) => LogInReturn(
        firstName: json["first_name"],
        lastName: json["last_name"],
        userUid: json["user_uid"],
        stacks: List<LogInReturnStack>.from(
            json["stacks"].map((x) => LogInReturnStack.fromJson(x))),
        selectedStacks:
            List<dynamic>.from(json["selected_stacks"].map((x) => x)),
        selectedOrgs: List<dynamic>.from(json["selected Orgs"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "user_uid": userUid,
        "stacks": List<dynamic>.from(stacks.map((x) => x.toJson())),
        "selected_stacks": List<dynamic>.from(selectedStacks.map((x) => x)),
        "selected Orgs": List<dynamic>.from(selectedOrgs.map((x) => x)),
      };
}

class LogInReturnStack {
  LogInReturnStack({
    required this.orgName,
    required this.orgUid,
    required this.stacks,
  });

  String orgName;
  String orgUid;
  List<StackStack> stacks;

  factory LogInReturnStack.fromJson(Map<String, dynamic> json) =>
      LogInReturnStack(
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
