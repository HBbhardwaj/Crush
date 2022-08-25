import 'dart:convert';

import 'package:crush/custom/textformfild.dart';
import 'package:crush/modal/login_modal.dart';
import 'package:crush/pages/dashBorad.dart';
import 'package:crush/pages/home.dart';
import 'package:crush/apis/api.dart';
import 'package:crush/pages/otp/otp_screen.dart';
import 'package:crush/pages/passwordrecovery.dart';
import 'package:crush/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String user_Id = '';
  String user_name = '';
  String email = '';

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
  String type = '';

  bool _rememberMeFlag = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void validate() {
    if (usernameController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Please Enter Email !',
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
    } else {
      showAlertDialog(context);
      getSignIn();
    }
  }

  // late SignInModel signInModel;
  // late Future<SignInModel> furureSignupModel;

  Future<SignInModel> getSignIn() async {
    var request = http.MultipartRequest('POST', Uri.parse(Apis.signin));
    request.fields.addAll({
      'email': usernameController.text,
      'password': passwordController.text,
    });
    http.Response response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      Navigator.of(context, rootNavigator: true).pop();
      var jsonString = response.body;
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      
      if (jsonMap['status'] == 100) {
      var prefs = await SharedPreferences.getInstance();

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
      }
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>  Dashboard("https://medium.com/"),
          ),
          (route) => false,
        );

      } else if (jsonMap['status'] == 101) {
        Fluttertoast.showToast(
            msg: jsonMap['error'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
             setState(() {
                type = jsonMap['type'];
              });
        if(jsonMap['is_verify'] == "true"){
              Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    OtpScreen(usernameController.text, type))
                    );
        }
           
      }
      return SignInModel.fromJson(json.decode(response.body));
    } else {
       Navigator.of(context, rootNavigator: true).pop();
        Fluttertoast.showToast(
            msg: 'Something went wrong, plase try again later!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
            
      print(response.body);
    }
    return SignInModel.fromJson(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Username',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    hintText: 'Username',
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
                const SizedBox(height: 25),
                Text(
                  'Password',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
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
                const SizedBox(
                  height: 15,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Theme(
                      child: Container(
                        height: 16,
                        width: 16,
                        color: Colors.white,
                        child: Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onChanged: (value) {
                              setState(() {
                                _rememberMeFlag = !_rememberMeFlag;
                              });
                            },
                            value: _rememberMeFlag,
                            activeColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1))),
                      ),
                      data: ThemeData(
                        unselectedWidgetColor: const Color(0xff505050),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const passwordrecovery()),
                        );
                      },
                      child: const Text(
                        "Remember Me/Password Recovery",
                        maxLines: 1,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: Color(0xFF271801),
                  ),
                  child: FlatButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    color: Color(0xfff271801),
                    textColor: Color(0xfffFFA406),
                    onPressed: () => validate(),
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Color(0xfff271801),
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(0)),
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _navigator();
                      },
                      child: const Text("Don't have an account?",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                          )),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Signup()),
                          );
                        },
                        child: const Text(
                          "  Create my account",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _navigator() {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }
}
