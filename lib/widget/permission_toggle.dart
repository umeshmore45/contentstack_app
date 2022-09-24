import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_contentstack_app/modules/submit.dart';
import 'package:my_contentstack_app/services/submit.dart';

class MyPermissionsWidget extends StatefulWidget {
  final List<dynamic> stackData;
  final String orgUid;
  final String userUid;
  const MyPermissionsWidget(
      {required this.stackData,
      required this.orgUid,
      required this.userUid,
      Key? key})
      : super(key: key);

  @override
  State<MyPermissionsWidget> createState() => _MyPermissionsWidget();
}

class _MyPermissionsWidget extends State<MyPermissionsWidget> {
  final Map<String, dynamic> _lights = {};

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.stackData[0].permissions.length; i++) {
      setState(() {
        _lights['value${i}'] = widget.stackData[0].permissions[i].isEnabled;
      });
    }
  }

  Future<SubmitStack> onSubmit(res) async {
    try {
      var data = await submitCall(res);
      print('hello run time ${data.body.runtimeType}');
      if (data.statusCode == 200) {
        final resStaring = data.body;
        return submitStackFromJson(resStaring);
      }
    } catch (err) {
      print(err);
      rethrow;
    }
    throw "Error";
  }

  @override
  Widget build(BuildContext context) {
    final parsedJson = widget.stackData[0];
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(
              child: Text('${parsedJson.stackName}',
                  style: const TextStyle(
                    color: Colors.black,
                  )),
            ),
            actions: [Container()]),
        body: ListView.builder(
          itemCount: parsedJson.permissions.length,
          itemBuilder: (context, i) {
            return SwitchListTile(
              title: Text(parsedJson.permissions[i].type),
              value: _lights['value${i}'],
              onChanged: (bool value) {
                setState(() {
                  _lights['value${i}'] = value;
                });
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              final Map<String, dynamic> sendData = {};
              final Map<String, dynamic> permissions = {};
              for (var i = 0; i < widget.stackData[0].permissions.length; i++) {
                var name = widget.stackData[0].permissions[i].type;
                permissions[name] = _lights['value${i}'];
              }
              sendData["user_uid"] = widget.userUid;
              sendData["org_uid"] = widget.orgUid;
              sendData["stack_api_key"] = parsedJson.stackApiKey;
              sendData["permissions"] = permissions;
              print(sendData);

              var data = await onSubmit(sendData);

              print(data.message);

              final snackBar = SnackBar(
                content: Text('Yay! ${data.message}!'),
                action: SnackBarAction(
                  label: 'sure',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            label: const Text('Submit'),
            icon: const Icon(Icons.save_outlined),
            backgroundColor: Colors.pink));
  }
}
