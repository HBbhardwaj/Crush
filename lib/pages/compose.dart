import 'dart:convert';

import 'package:crush/apis/api.dart';
import 'package:crush/modal/compose_modal.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Compose extends StatefulWidget {
  const Compose({ Key? key }) : super(key: key);

  @override
  State<Compose> createState() => _ComposeState();
}



class _ComposeState extends State<Compose> {

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

  TextEditingController sendToController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController MessageController = TextEditingController();

void validate() {
    if (subjectController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Please Enter subject !',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (sendToController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Please Enter your Email!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if (MessageController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Please Enter your Message',
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


Future<ComposeModal> Addcontact() async {
    var request = http.MultipartRequest('POST', Uri.parse(Apis.send_message));
    request.fields.addAll({
      'subject': subjectController.text,
      'user_email': sendToController.text,
      'sender_id' : user_Id,
      'message' : MessageController.text
    });
    http.Response response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      Navigator.of(context, rootNavigator: true).pop();
      var jsonString = response.body;
      Map<String, dynamic> jsonMap = json.decode(jsonString);
          print(jsonMap);
      if (jsonMap['status'] == 100) {
      // var prefs = await SharedPreferences.getInstance();
        Fluttertoast.showToast(
            msg: jsonMap['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);

            sendToController.text = '';
            MessageController.text = '';
            subjectController.text = '';

      } else if (jsonMap['status'] == 101) {
        Fluttertoast.showToast(
            msg: jsonMap['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      return ComposeModal.fromJson(json.decode(response.body));
    } else {
      print(response.body);
    }
    return ComposeModal.fromJson(jsonDecode(response.body));
  }


 
 void _loadUserID() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      user_Id = (prefs.getString('user_id') ?? "");
      user_name = (prefs.getString('user_name') ?? "");
      email = (prefs.getString('email') ?? "");
    });
  }

    void initState() {
    super.initState();
    _loadUserID();

  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Send To (User email or Friends Name)',
            style: TextStyle(fontSize: 16),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(left: 2, right: 2, top: 10, bottom: 10),
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border.all(color: Color(0xffffC4C4C4)), // set border width
              borderRadius: BorderRadius.all(
                  Radius.circular(1.0)), // set rounded corner radius
            ),
            child:  TextField(
              controller: sendToController,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'user email',
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          const Text(
            'Subject',
            style: TextStyle(fontSize: 16),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(left: 2, right: 2, top: 10, bottom: 10),
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border.all(color: Color(0xffffC4C4C4)), // set border width
              borderRadius: BorderRadius.all(
                  Radius.circular(1.0)), // set rounded corner radius
            ),
            child:  TextField(
              controller: subjectController,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'subject',
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Message',
            style: TextStyle(fontSize: 16),
          ),
          Container(
            margin: EdgeInsets.only(left: 2, right: 2, top: 10, bottom: 10),
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: Color(0xffffC4C4C4), // set border color
                  width: 1.0), // set border width
              borderRadius: BorderRadius.all(
                  Radius.circular(1.0)), // set rounded corner radius
            ),
            child:  TextField(
              controller: MessageController,
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
                    width: 150,
                    height: 45.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: FlatButton(
                      child: const Text(
                        'Save Changes',
                        style: TextStyle(fontSize: 18.0),
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
        ],
      ),
    );
  }
}