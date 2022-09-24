import 'package:flutter/material.dart';

class MyPermissionsWidget extends StatefulWidget {
  final List<dynamic> stackData;
  final String orgUid;
  const MyPermissionsWidget(
      {required this.stackData, required this.orgUid, Key? key})
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
        ));
  }
}
