import 'package:flutter/material.dart';

class MySelectStack extends StatefulWidget {
  const MySelectStack({super.key});

  @override
  State<MySelectStack> createState() => _MySelectStack();
}

class _MySelectStack extends State<MySelectStack> {
  int _index = 0;

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
          content: const Column(children: []),
        ),
      ],
    ));
  }
}
