import 'package:flutter/material.dart';
class RadioButton1 extends StatefulWidget {
  @override
  _RadioButtonState createState() => _RadioButtonState();
}
class _RadioButtonState extends State<RadioButton1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:80,
      width: 80,
      color:Colors.red,
      child: const Padding(
        padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
        
      ),
    );
  }
}