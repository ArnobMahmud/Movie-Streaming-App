import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _value == false ? Colors.white : Colors.black,
        body: Switch(
          value: _value,
          onChanged: (val) {
            setState(() {
              _value = val;
            });
          },
        )
        );
  }
}
