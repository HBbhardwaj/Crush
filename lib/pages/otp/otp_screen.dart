import 'package:flutter/material.dart';
// import 'package:shop_app/size_config.dart';

import 'components/body.dart';

class OtpScreen extends StatefulWidget {
  static String routeName = "/otp";

String email;
String type;
 OtpScreen(this.email,this.type);

  @override
  State<OtpScreen> createState() => _OtpScreenState(this.email,this.type);
}

class _OtpScreenState extends State<OtpScreen> {
  String email;
  String type;

  _OtpScreenState(this.email,this.type);

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
    backgroundColor: Color(0xFFFFff9f04),
    elevation: 0,
      ),
      body: Body(email,type),
    );
  }
}
