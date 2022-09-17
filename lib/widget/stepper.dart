import 'package:flutter/material.dart';
import 'package:my_contentstack_app/modules/login.dart';
import 'package:my_contentstack_app/services/login.dart';

class MyStatefulStepper extends StatefulWidget {
  const MyStatefulStepper({super.key});

  @override
  State<MyStatefulStepper> createState() => _MyStatefulStepper();
}

enum SingingCharacter { na, eu, azNa }

class _MyStatefulStepper extends State<MyStatefulStepper> {
  LogIn? _logData;
  int _index = 0;
  SingingCharacter? _character = SingingCharacter.na;
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<LogIn> onSubmit(email, password) async {
    try {
      var data = await logInCall(email, password);

      if (data.statusCode == 201) {
        String resStaring = data.body;
        return logInFromJson(resStaring);
      }
    } catch (err) {
      rethrow;
    }
    throw "test";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stepper(
      currentStep: _index,
      controlsBuilder: (BuildContext context, ControlsDetails controlsDetails) {
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
                onPressed: () async {
                  String email = nameController.text;
                  String password = passwordController.text;
                  LogIn data = await onSubmit(email, password);
                  setState(() {
                    _logData = data;
                  });
                },
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
            ListTile(
              title: const Text('North America'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.na,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Europe'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.eu,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ]),
        ),
        Step(
            title: const Text('Log In'),
            content: Column(children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
            ])),
      ],
    ));
  }
}
