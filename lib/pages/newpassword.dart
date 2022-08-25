import 'dart:convert';

import 'package:crush/apis/api.dart';
import 'package:crush/modal/reset_modal.dart';
import 'package:crush/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Newpassword extends StatefulWidget {
  // const Newpassword({ Key? key }) : super(key: key);
  String userId;
  Newpassword(this.userId);

  @override
  _NewpasswordState createState() => _NewpasswordState(this.userId);
}

class _NewpasswordState extends State<Newpassword> {
String userId;
_NewpasswordState(this.userId);

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

   TextEditingController newpassController = TextEditingController();
   TextEditingController confirmpassController = TextEditingController();


  void validate() {
    if (newpassController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Please Enter New Password !',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if (confirmpassController.text != confirmpassController.text) {
      Fluttertoast.showToast(
          msg: 'Please enter same password!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }else {
      showAlertDialog(context);
      resetPassword();
    }
  }
    Future<ResetModel> resetPassword() async {
    var request = http.MultipartRequest('POST', Uri.parse(Apis.reset_password));

    request.fields.addAll({
      'id':userId,
      'password': newpassController.text,
      'confirm_password': confirmpassController.text
    });
    http.Response response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      Navigator.of(context, rootNavigator: true).pop();
      var jsonString = response.body;
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      if (jsonMap['status'] == 100) {
       
        print("+++++++++++200+++");
        Fluttertoast.showToast(
            msg: jsonMap['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Login()));
      } else if (jsonMap['status'] == 101) {
        print("+++++++++++201+++");
        print(jsonMap['error']);
        Fluttertoast.showToast(
            msg: jsonMap['error'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      return ResetModel.fromJson(json.decode(response.body));
    } else {
      Navigator.of(context, rootNavigator: true).pop();
      print(response.body);
    }
    return ResetModel.fromJson(jsonDecode(response.body));
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
                top: 60,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      " Reset Password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'Please enter your username or email address. You will receive a link to create a new password via email.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17,
                          fontStyle: FontStyle.italic,
                          color: Color(0xffAFB1B2)),
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(-0.9, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                      child: Text(
                        'New Password',
                      ),
                    ),
                  ),
                   Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: TextFormField(
                      controller: newpassController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                   const Align(
                    alignment: AlignmentDirectional(-0.9, 0),
                    child: Padding(
                      padding: EdgeInsets.only(top:15),
                      child: Text(
                        'Confirm Password',
                      ),
                    ),
                  ),
                   Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: TextFormField(
                      controller: confirmpassController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: FlatButton(
                      child: const Text(
                        'Save password',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      color: Color(0xfffa8202),
                      textColor: Colors.white,
                     onPressed: () => validate(),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color(0xfffa8202),
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}