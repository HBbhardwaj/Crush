import 'dart:convert';

import 'package:crush/apis/api.dart';
import 'package:crush/modal/signup_model.dart';
import 'package:crush/pages/home.dart';
import 'package:crush/pages/otp/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String type = '';
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

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();
  TextEditingController marriednameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController maritalStatusController = TextEditingController();

  validateEmail() {
    var email = emailAddressController.text;
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email);
    return emailValid ;
  }

  void validate() {
    if (userNameController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Please Enter Username !',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (emailAddressController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Please Enter email',
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
    } else if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Enter your password!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (confirmpassController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Conform your password!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (confirmpassController.text != passwordController.text) {
      Fluttertoast.showToast(
          msg: 'Please enter same password!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      showAlertDialog(context);
      getSignUp();
    }
  }

  late SignupModel signupModel;
  late Future<SignupModel> furureSignupModel;

  Future<SignupModel> getSignUp() async {
    var request = http.MultipartRequest('POST', Uri.parse(Apis.signup));

    request.fields.addAll({
      'signup_username': userNameController.text,
      'signup_email': emailAddressController.text,
      'password': passwordController.text,
      'confirm_password': confirmpassController.text,
      'married_name': marriednameController.text,
      'age': ageController.text,
      'marital_status': maritalStatusController.text
    });
    http.Response response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      Navigator.of(context, rootNavigator: true).pop();
      var jsonString = response.body;
      print(jsonString);
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

        setState(() {
          type = jsonMap['type'];
        });
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    OtpScreen(emailAddressController.text, type)));
      } else if (jsonMap['status'] == 101) {
        print("+++++++++++201+++");
        Fluttertoast.showToast(
            msg: jsonMap['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      return SignupModel.fromJson(json.decode(response.body));
    } else {
      print(response.body);
    }
    return SignupModel.fromJson(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          // color: Colors.green,
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Account Details',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: const TextSpan(
                      text: 'Username',
                      // style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: ' *',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: userNameController,
                    decoration: const InputDecoration(
                      hintText: 'Username',
                      // hintText:AppLocalization.of(context)!.translate('email'),
                      hintStyle:
                          TextStyle(fontSize: 15.0, color: Color(0xff505050)),
                      isCollapsed: true,
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: Color(0xfff1f1f1),

                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff1f1f1)),
                          borderRadius: BorderRadius.all(Radius.zero)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff1f1f1)),
                          borderRadius: BorderRadius.all(Radius.zero)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff1f1f1)),
                          borderRadius: BorderRadius.all(Radius.zero)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: const TextSpan(
                      text: 'Email Address',
                      // style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: ' *',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: emailAddressController,
                    decoration: const InputDecoration(
                      hintText: 'email',
                      hintStyle:
                          TextStyle(fontSize: 15.0, color: Color(0xff505050)),
                      isCollapsed: true,
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: Color(0xfff1f1f1),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff1f1f1)),
                          borderRadius: BorderRadius.all(Radius.zero)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff1f1f1)),
                          borderRadius: BorderRadius.all(Radius.zero)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff1f1f1)),
                          borderRadius: BorderRadius.all(Radius.zero)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: const TextSpan(
                      text: 'Choose a Password',
                      // style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: ' *',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,
                    // controller:
                    controller: passwordController,
                    decoration: const InputDecoration(
                      // hintText:AppLocalization.of(context)!.translate('email'),
                      hintStyle:
                          TextStyle(fontSize: 15.0, color: Color(0xff505050)),
                      isCollapsed: true,
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: Color(0xfff1f1f1),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff1f1f1)),
                          borderRadius: BorderRadius.all(Radius.zero)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff1f1f1)),
                          borderRadius: BorderRadius.all(Radius.zero)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff1f1f1)),
                          borderRadius: BorderRadius.all(Radius.zero)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: const TextSpan(
                      text: 'Confirm Password',
                      // style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: ' *',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,
                    controller: confirmpassController,
                    decoration: const InputDecoration(
                      // hintText:AppLocalization.of(context)!.translate('email'),
                      hintStyle:
                          TextStyle(fontSize: 15.0, color: Color(0xff505050)),
                      isCollapsed: true,
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: Color(0xfff1f1f1),

                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff1f1f1)),
                          borderRadius: BorderRadius.all(Radius.zero)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff1f1f1)),
                          borderRadius: BorderRadius.all(Radius.zero)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff1f1f1)),
                          borderRadius: BorderRadius.all(Radius.zero)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Profile Details',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Married Name',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: marriednameController,
                    decoration: const InputDecoration(
                      hintText: 'Married Name',
                      hintStyle:
                          TextStyle(fontSize: 15.0, color: Color(0xff505050)),
                      isCollapsed: true,
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: Color(0xfff1f1f1),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff1f1f1)),
                          borderRadius: BorderRadius.all(Radius.zero)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff1f1f1)),
                          borderRadius: BorderRadius.all(Radius.zero)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff1f1f1)),
                          borderRadius: BorderRadius.all(Radius.zero)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Age',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: ageController,
                    decoration: const InputDecoration(
                      hintText: 'Age',
                      hintStyle:
                          TextStyle(fontSize: 15.0, color: Color(0xff505050)),
                      isCollapsed: true,
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: Color(0xfff1f1f1),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff1f1f1)),
                          borderRadius: BorderRadius.all(Radius.zero)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff1f1f1)),
                          borderRadius: BorderRadius.all(Radius.zero)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff1f1f1)),
                          borderRadius: BorderRadius.all(Radius.zero)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Marital Status',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: maritalStatusController,
                    decoration: const InputDecoration(
                      hintText: 'Marital Status',
                      hintStyle:
                          TextStyle(fontSize: 15.0, color: Color(0xff505050)),
                      isCollapsed: true,
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: Color(0xfff1f1f1),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff1f1f1)),
                          borderRadius: BorderRadius.all(Radius.zero)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff1f1f1)),
                          borderRadius: BorderRadius.all(Radius.zero)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfff1f1f1)),
                          borderRadius: BorderRadius.all(Radius.zero)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Color(0xFF271801),
                    ),
                    child: FlatButton(
                      child: const Text(
                        'Complete Sign Up',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      color: Color(0xfff271801),
                      textColor: Color(0xfffFFA406),
                      onPressed: () => {validate()},
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color(0xfff271801),
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(0)),
                    ),
                  ),
                  // const Text(
                  //   'Create a Page for a celebrity, band or business.',
                  //   style: TextStyle(color: Colors.white, fontSize: 18),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          // _navigator();
                        },
                        child: const Text("Already have an account?",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: const Text(
                            "  Sign In",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //  _navigator() {
  //   return Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => Home(),
  //     ),
  //   );
  // }
}
