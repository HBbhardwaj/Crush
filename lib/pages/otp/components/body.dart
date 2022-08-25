import 'dart:convert';

import 'package:crush/constants.dart';
import 'package:crush/modal/otp_modal.dart';
import 'package:crush/pages/home.dart';
import 'package:crush/pages/newpassword.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../apis/api.dart';
import '../../../modal/otp_modal.dart';

class Body extends StatefulWidget {
  String email;
  String type;
  Body(this.email,this.type);

  @override
  State<Body> createState() => _BodyState(this.email,this.type);
}

class _BodyState extends State<Body> {
  String email;
  String type;
  _BodyState(this.email,this.type);

  String user_Id = '';
  String user_name = '';
 
    showAlertDialog(BuildContext alartContext) {
    AlertDialog alert = AlertDialog(
      content: Container(
          height: 40,
          width: 40,
          color: Colors.transparent,
          child: const Center(child: CircularProgressIndicator())),
    );
    showDialog(
      barrierDismissible: false,
      context: alartContext,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  TextEditingController field1Controller = TextEditingController();
  TextEditingController field2Controller = TextEditingController();
  TextEditingController field3Controller = TextEditingController();
  TextEditingController field4Controller = TextEditingController();

  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }else{
      focusNode!.previousFocus();
    }
  }

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

 void validate() {
    if (field1Controller.text.isEmpty && field2Controller.text.isEmpty && field3Controller.text.isEmpty && field4Controller.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'All field requird!!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } 
    else {
      showAlertDialog(context);
      OtpVerify();
    }
  }



  late Future<OtpModel> furureOtpModel;

  Future<OtpModel> OtpVerify() async {
    var request = http.MultipartRequest('POST', Uri.parse(Apis.verifyaccount));

   request.fields.addAll({
  'email': email,
  'code': field1Controller.text+field2Controller.text+field3Controller.text+field4Controller.text,
  'type':type
   });

    http.Response response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      Navigator.of(context, rootNavigator: true).pop();
      var jsonString = response.body;
      print(jsonString);
      Map<String, dynamic> jsonMap = json.decode(jsonString);
  
      if (jsonMap['status'] == 100) {

          if(jsonMap['type'] == '1'){
             Fluttertoast.showToast(
            msg: jsonMap['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);

            if (jsonMap['data']['user_id'] != null) {
                  var userId = jsonMap['data']['user_id'];
                  Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) =>  Newpassword(userId)));

            }
        } else if(jsonMap['type'] == '0'){
          var prefs = await SharedPreferences.getInstance();
        print("+++++++++++200+++");
        Fluttertoast.showToast(
            msg: jsonMap['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
         if (jsonMap['data']['user_id'] != null) {
        setState(() {
          // obtain shared preferences
          // set value
          user_Id = jsonMap['data']['user_id'];
          user_name = jsonMap['data']['user_nicename'];

          email = jsonMap['data']['user_email'];
         
          prefs.setString('user_id', user_Id);
          prefs.setString('user_name', user_name);
    
          prefs.setString('email', email);
      
        });
        
            Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>  Home()));
         }

        }
        

      } else if (jsonMap['status'] == 101) {
        print("+++++++++++201+++");
        print(jsonMap['data']);
        Fluttertoast.showToast(
            msg: jsonMap['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      return OtpModel.fromJson(json.decode(response.body));
    } else {
      print(response.body);
    }
    return OtpModel.fromJson(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            const Text(
              "OTP Verification",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text("We sent your code to $email"),
            buildTimer(),
            Form(
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
                            controller: field1Controller,
                            autofocus: true,
                            obscureText: true,
                            style: TextStyle(fontSize: 24),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: otpInputDecoration,
                            onChanged: (value) => nextField(value, pin2FocusNode)
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: TextFormField(
                            controller: field2Controller,
                            focusNode: pin2FocusNode,
                            obscureText: true,
                            style: TextStyle(fontSize: 24),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: otpInputDecoration,
                             onChanged: (value) => nextField(value, pin3FocusNode)
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: TextFormField(
                            controller: field3Controller,
                            focusNode: pin3FocusNode,
                            obscureText: true,
                            style: TextStyle(fontSize: 24),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: otpInputDecoration,
                             onChanged: (value) => nextField(value, pin4FocusNode)
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: TextFormField(
                            controller: field4Controller,
                            focusNode: pin4FocusNode,
                            obscureText: true,
                            style: TextStyle(fontSize: 24),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: otpInputDecoration,
                            onChanged: (value) {
                              if (value.length == 1) {
                                pin4FocusNode!.previousFocus();
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
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // OTP code resend
              },
              child: Text(
                "Resend OTP Code",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text(
                  'Verify',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Color(0xFFFFff9f04),
                textColor: Colors.white,
                onPressed: () {
                  validate();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            // style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
