import 'dart:convert';
import 'package:crush/apis/api.dart';
import 'package:crush/modal/forget_modal.dart';
import 'package:crush/pages/newpassword.dart';
import 'package:crush/pages/otp/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class passwordrecovery extends StatefulWidget {
  const passwordrecovery({Key? key}) : super(key: key);

  @override
  _passwordrecoveryState createState() => _passwordrecoveryState();
}

class _passwordrecoveryState extends State<passwordrecovery> {
  TextEditingController emailController = TextEditingController();

  String type = '';

 validateEmail() {
    var email = emailController.text;
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email);
    return emailValid ;
  }


  void validate() {
    if (emailController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Please Enter Email !',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (!validateEmail()) {
      Fluttertoast.showToast(
          msg: 'Please enter valid Email Address!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }else {
      showAlertDialog(context);
      recoverPassword();
    }
  }

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

  // late Future<ForgotModel> furureSignupModel;

  Future<ForgotModel> recoverPassword() async {
    var request = http.MultipartRequest('POST', Uri.parse(Apis.forgotPassword));

    request.fields.addAll({
      'email': emailController.text.trim(),
    });
    http.Response response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      Navigator.of(context, rootNavigator: true).pop();
      var jsonString = response.body;
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      if (jsonMap['status'] == 100) {
        setState(() {
          type = jsonMap['type'];
        });
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
                builder: (context) => OtpScreen(emailController.text,type)));
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
      return ForgotModel.fromJson(json.decode(response.body));
    } else {
      Navigator.of(context, rootNavigator: true).pop();
      print(response.body);
    }
    return ForgotModel.fromJson(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
                top: 100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Password Recovery",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
                        'Email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                        'Reset my password',
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
