import 'package:flutter/material.dart';
import 'package:my_contentstack_app/modules/login.dart';
import 'package:my_contentstack_app/widget/permission_toggle.dart';

class MySelectStack extends StatefulWidget {
  final LogInReturn data;
  const MySelectStack({required this.data, Key? key}) : super(key: key);

  @override
  State<MySelectStack> createState() => _MySelectStack();
}

class _MySelectStack extends State<MySelectStack> {
  int _index = 0;
  String orgvalue = "blt18ca3799a1c334ef";
  List<dynamic> stackList = [];
  String stackValue = "bltc9614e874a81506d";

  @override
  void initState() {
    super.initState();
    // print(widget.data.user[0].stacks.map((e) => ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(
              child: Text(
                  "Hello ${widget.data.user[0].firstName} ${widget.data.user[0].lastName}",
                  style: const TextStyle(
                    color: Colors.black,
                  )),
            ),
            actions: [Container()]),
        body: Stepper(
          currentStep: _index,
          controlsBuilder:
              (BuildContext context, ControlsDetails controlsDetails) {
            if (_index == 0) {
              return Row(
                children: <Widget>[
                  TextButton(
                    onPressed: controlsDetails.onStepContinue,
                    child: const Text('Continue'),
                  ),
                  Container()
                ],
              );
            } else {
              return Row(
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      final reslut = stackList
                          .where((element) => element.stackApiKey == stackValue)
                          .toList();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyPermissionsWidget(
                                  stackData: reslut,
                                  orgUid: orgvalue,
                                  userUid: widget.data.user[0].userUid)));
                    },
                    child: const Text('Submit'),
                  ),
                  TextButton(
                    onPressed: controlsDetails.onStepCancel,
                    child: const Text('Previous'),
                  ),
                ],
              );
            }
          },
          onStepCancel: () {
            setState(() {
              _index -= 1;
            });
          },
          onStepContinue: () {
            setState(() {
              _index += 1;
            });
          },
          // onStepTapped: (int index) {
          //   setState(() {
          //     _index = index;
          //   });
          // },
          steps: <Step>[
            Step(
              title: const Text('Select Organization'),
              content: Column(children: [
                DropdownButton<String>(
                  value: orgvalue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? value) {
                    final stackData = [];
                    late String stackName;
                    widget.data.user[0].stacks.forEach((element) {
                      if (element.orgUid == value) {
                        element.stacks.forEach((item) {
                          stackData.add(item);
                          stackName = item.stackApiKey;
                        });
                      }
                    });
                    setState(() {
                      stackValue = stackName;
                      stackList = stackData;
                      orgvalue = value!;
                    });
                  },
                  items: widget.data.user[0].stacks
                      .map((e) => DropdownMenuItem(
                          value: e.orgUid, child: Text(e.orgName)))
                      .toList(),
                )
              ]),
            ),
            Step(
              title: const Text('Select Stack'),
              content: Column(children: [
                DropdownButton<dynamic>(
                    value: stackValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (dynamic value) {
                      setState(() {
                        stackValue = value;
                      });
                    },
                    items: stackList
                        .map((e) => DropdownMenuItem(
                            value: e.stackApiKey, child: Text(e.stackName)))
                        .toList()),
              ]),
            ),
          ],
        ));
  }
}
