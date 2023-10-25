import 'package:flutter/material.dart';
import 'package:todo_app/Buttonss/button.dart';

// ignore: must_be_immutable
class SettingPage extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller1;
  // controller2, controller3, controller4;
  VoidCallback submit;
  SettingPage({
    super.key,
    required this.controller1,
    // required this.controller2,
    // required this.controller3,
    // required this.controller4,
    required this.submit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text('Setting'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          child: Column(
            children: [
              TextFormField(
                controller: controller1,
                decoration: const InputDecoration(
                  hintText: 'Add new task',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MyButton(text: 'Submit', onPressed: submit),
            ],
          ),
        ),
      ),
    );
  }
}
