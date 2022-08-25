import 'package:crush/constants.dart';
import 'package:flutter/material.dart';

class OtpForm extends StatefulWidget {
  String field1, field2, field3, field4;
  OtpForm(
      {Key? key,
      required this.field1,
      required this.field2,
      required this.field3,
      required this.field4})
      : super(key: key);

  @override
  _OtpFormState createState() =>
      _OtpFormState(this.field1, this.field2, this.field3, this.field4);
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  String field1, field2, field3, field4;
  _OtpFormState(this.field1, this.field2, this.field3, this.field4);

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  // TextEditingController field1Controller = TextEditingController();
  // TextEditingController field2Controller = TextEditingController();
  // TextEditingController field3Controller = TextEditingController();
  // TextEditingController field4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 40,
                  child: TextFormField(
                    // controller: field1Controller,
                    autofocus: true,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) {
                      setState(() {
                        field1 = value;
                      });
                      nextField(value, pin2FocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: 40,
                  child: TextFormField(
                    // controller: field2Controller,
                    focusNode: pin2FocusNode,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) {
                       setState(() {
                        field2 = value;
                      });
                       nextField(value, pin3FocusNode);
                    }
                  ),
                ),
                SizedBox(
                  width: 40,
                  child: TextFormField(
                    // controller: field3Controller,
                    focusNode: pin3FocusNode,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value){
                       setState(() {
                        field3 = value;
                      });
                       nextField(value, pin4FocusNode);
                       }

                  ),
                ),
                SizedBox(
                  width: 40,
                  child: TextFormField(
                    // controller: field4Controller,
                    focusNode: pin4FocusNode,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) {
                       setState(() {
                        field4 = value;
                      });
                      if (value.length == 1) {
                        pin4FocusNode!.unfocus();
                        // Then you need to check is the code is correct or not
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
