import 'dart:convert';

import 'package:crush/apis/api.dart';
import 'package:crush/modal/contact_modal.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class ContactScreen extends StatefulWidget {
  var screenkey;
  ContactScreen({Key? key, required this.screenkey}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState(this.screenkey);
}

class _ContactScreenState extends State<ContactScreen> {
  var screenkey;
  _ContactScreenState(this.screenkey);
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
  @override

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
 TextEditingController subjectController = TextEditingController();
  TextEditingController msgController = TextEditingController();

  void validate() {
    if (nameController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Please Enter Name !',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (emailController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Please Enter your Email!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if (subjectController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Please Enter your subject!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }else {
      showAlertDialog(context);
      Addcontact();
    }
  }

Future<ContactModal> Addcontact() async {
    var request = http.MultipartRequest('POST', Uri.parse(Apis.contactus));
    request.fields.addAll({
      'your-name': nameController.text,
      'email': emailController.text,
      'your-subject' : subjectController.text,
      'your-message' : msgController.text
    });
    http.Response response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      Navigator.of(context, rootNavigator: true).pop();
      var jsonString = response.body;
      Map<String, dynamic> jsonMap = json.decode(jsonString);

      if (jsonMap['status'] == 100) {
      // var prefs = await SharedPreferences.getInstance();

        Fluttertoast.showToast(
            msg: jsonMap['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);

            nameController.text = '';
            emailController.text = '';
            subjectController.text = '';
            msgController.text = '';
      } else if (jsonMap['status'] == 101) {
        Fluttertoast.showToast(
            msg: jsonMap['error'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      return ContactModal.fromJson(json.decode(response.body));
    } else {
      print(response.body);
    }
    return ContactModal.fromJson(jsonDecode(response.body));
  }


  Widget build(BuildContext context) => Scaffold(
        // appBar: screenkey== "1" ? AppBar(
        //       title: Text("Contact Us"),
        //       backgroundColor: Color(0xFFFFff9f04),
        //     ): AppBar(
        //       elevation: 0,
        //     //  title: Text("Contact Us"),
        //      backgroundColor: Colors.white,
        //     ) ,
        body: SafeArea(
          child: Container(
            color: Color(0xffffFFFDFD),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: screenkey== "1" ? true : false,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      color: Color(0xFFFFff9f04),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          const Text('Contact Us',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                          ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                    child: Text(
                      'We are here to help',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                    child: Text(
                      'We know you are here to connect with a crush, Give us a shout if you have any issues signing up or logging in, shoot us an email to get your back on track.',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 16, height: 1.5, color: Color(0xfff090909)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Your Name',
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' *',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Color(0xfffff7f5f5), // set border color
                          width: 1.0), // set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(2.0)), // set rounded corner radius
                    ),
                    child:  TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Label text',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Your Email',
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' *',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Color(0xfffff7f5f5), // set border color
                          width: 1.0), // set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(2.0)), // set rounded corner radius
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'LoremIpsum@gmail.com',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Your Subject',
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' *',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Color(0xfffff7f5f5), // set border color
                          width: 1.0), // set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(2.0)), // set rounded corner radius
                    ),
                    child: TextField(
                      controller: subjectController,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'LoremIpsum@gmail.com',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(-0.9, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Text(
                        'Your Message',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Color(0xfffff7f5f5), // set border color
                          width: 1.0), // set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(2.0)), // set rounded corner radius
                    ),
                    child: TextField(
                      controller: msgController,
                      maxLines: 8,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'LoremIpsum@gmail.com',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 10),
                    width: 90,
                    height: 45.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: FlatButton(
                      child: const Text(
                        'SEND',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      color: Color(0xfffff9d15),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color(0xfffff9d15),
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {
                        validate();
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                    ),
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
