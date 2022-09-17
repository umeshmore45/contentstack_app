import 'package:flutter/material.dart';
import 'package:my_contentstack_app/modules/login.dart';

class MySelectStack extends StatefulWidget {
  final LogInReturn data;
  const MySelectStack({required this.data, Key? key}) : super(key: key);

  @override
  State<MySelectStack> createState() => _MySelectStack();
}

final List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class _MySelectStack extends State<MySelectStack> {
  int _index = 0;
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
              child:
                  Text("Hello ${widget.data.firstName} ${widget.data.lastName}",
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
                ],
              );
            } else {
              return Row(
                children: <Widget>[
                  TextButton(
                    onPressed: () async {},
                    child: const Text('Log In'),
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
              title: const Text('Select Region'),
              content: Column(children: [
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
              ]),
            ),
          ],
        ));
  }
}
