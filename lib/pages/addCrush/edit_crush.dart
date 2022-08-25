import 'dart:convert';
import 'dart:io';

import 'package:crush/apis/api.dart';
import 'package:crush/modal/addCrush_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EditCrush extends StatefulWidget {
  var crushData;
  EditCrush({Key? key, required this.crushData}) : super(key: key);

  @override
  State<EditCrush> createState() => _EditCrushState(this.crushData);
}

class _EditCrushState extends State<EditCrush> {
  var crushImage;
  String imagelink = " ";
  File? imageFile;
  String user_Id = '';
  String user_name = '';
  String email = '';
  String image_name = '';

  final imagePicker = ImagePicker();

  var crushData;
  _EditCrushState(this.crushData);
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
    setState(() {
      yourCrushController.text = widget.crushData.crushName;
      middleNameController.text = widget.crushData.middleName;
      maidenNameController.text = widget.crushData.maidenName;
      marriedNameController.text = widget.crushData.marriedName;
      townCityController.text = widget.crushData.townCity;
      schoolWorkController.text = widget.crushData.schoolWork;
      descriptionController.text = widget.crushData.description;
      crushImage = widget.crushData.crushImage;
    });
  }

  TextEditingController yourCrushController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController marriedNameController = TextEditingController();
  TextEditingController townCityController = TextEditingController();
  TextEditingController maidenNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController schoolWorkController = TextEditingController();

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      imagelink = "";
      setState(() {
        imageFile = File(pickedFile.path);
        imagelink = imageFile!.path;
        var videoName = imageFile!.path.split('/').last;
        print(videoName);
        image_name = videoName;
      });
    }
  }

  void validate() {
    if (yourCrushController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Please Enter your Name !',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (middleNameController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Please Enter your Middle Name',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (marriedNameController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Enter your Married Name!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (townCityController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Please Enter your address!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (maidenNameController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Please enter your maiden name!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (schoolWorkController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Please enter school details!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }  else if (descriptionController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Please enter description!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      showAlertDialog(context);
      addyourCrush();
    }
  }

  Future<AddCrush> addyourCrush() async {
    var request = http.MultipartRequest('POST', Uri.parse(Apis.editCrush));
    request.fields.addAll({
      'crush_name': yourCrushController.text,
      'middle_name': middleNameController.text,
      'married_name': marriedNameController.text,
      'town_city': townCityController.text,
      'maiden_name': maidenNameController.text,
      'description': descriptionController.text,
      'school_work': schoolWorkController.text,
      'userid': user_Id,
      'id': widget.crushData.id
    });
     
     
     imageFile != null ? request.files
        .add(await http.MultipartFile.fromPath('crush_image', imagelink)) : null;
    

    http.Response response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      Navigator.of(context, rootNavigator: true).pop();
      try {
        var jsonString = response.body;
        Map<String, dynamic> jsonMap = json.decode(jsonString);

        if (jsonMap['status'] == 100) {
          print("data+++++++++++++++add");
          Fluttertoast.showToast(
              msg: jsonMap['msg'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0);

          yourCrushController.text = '';
          middleNameController.text = '';
          marriedNameController.text = '';
          townCityController.text = '';
          maidenNameController.text = '';
          descriptionController.text = '';
          schoolWorkController.text = '';
        } else if (jsonMap['status'] == 101) {
          Fluttertoast.showToast(
              msg: jsonMap['error'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      } catch (e) {
        print("exception+++++++++++++++++++++++++++++++++++");
        print(e);
      }
      return AddCrush.fromJson(json.decode(response.body));
    } else {
      print(response.body);
      print('server error++++++++++++');
    }
    return AddCrush.fromJson(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Crush"),
        backgroundColor: Color(0xFFFFff9f04),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Card(
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
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
                  width: 330,
                  margin: EdgeInsets.only(left: 20, top: 10, right: 20),
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Color(0xffffC4C4C4)
                            .withOpacity(0.5), // set border color
                        width: 1.0), // set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(2.0)), // set rounded corner radius
                  ),
                  child: TextField(
                    controller: yourCrushController,
                    decoration: const InputDecoration(
                      isDense: true,
                      hintText: 'Label text',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: RichText(
                    text: const TextSpan(
                      text: 'Middle Name',
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
                  width: 330,
                  margin: EdgeInsets.only(left: 20, top: 10, right: 20),
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Color(0xffffC4C4C4)
                            .withOpacity(0.5), // set border color
                        width: 1.0), // set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(2.0)), // set rounded corner radius
                  ),
                  child: TextField(
                    controller: middleNameController,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Label text',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: RichText(
                    text: const TextSpan(
                      text: 'Maiden Name',
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
                  width: 330,
                  margin: EdgeInsets.only(left: 20, top: 10, right: 20),
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Color(0xffffC4C4C4)
                            .withOpacity(0.5), // set border color
                        width: 1.0), // set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(2.0)), // set rounded corner radius
                  ),
                  child: TextField(
                    controller: maidenNameController,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Label text',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: RichText(
                    text: const TextSpan(
                      text: 'Married Name',
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
                  width: 330,
                  margin: EdgeInsets.only(left: 20, top: 10, right: 20),
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Color(0xffffC4C4C4)
                            .withOpacity(0.5), // set border color
                        width: 1.0), // set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(2.0)), // set rounded corner radius
                  ),
                  child: TextField(
                    controller: marriedNameController,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Label text',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: RichText(
                    text: const TextSpan(
                      text: 'Town/city/state',
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
                  width: 330,
                  margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Color(0xffffC4C4C4)
                            .withOpacity(0.5), // set border color
                        width: 1.0), // set border width
                    borderRadius: const BorderRadius.all(
                        Radius.circular(2.0)), // set rounded corner radius
                  ),
                  child: TextField(
                    controller: townCityController,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Label text',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: RichText(
                    text: const TextSpan(
                      text: 'School/work/location',
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
                  width: 330,
                  margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Color(0xffffC4C4C4)
                            .withOpacity(0.5), // set border color
                        width: 1.0), // set border width
                    borderRadius: const BorderRadius.all(
                        Radius.circular(2.0)), // set rounded corner radius
                  ),
                  child: TextField(
                    controller: schoolWorkController,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Label text',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: RichText(
                    text: const TextSpan(
                      text: 'Crush Picture',
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
                Row(
                  children: [
                    Container(
                      width: 140,
                      height: 32,
                      alignment: Alignment.center,
                      margin:
                          const EdgeInsets.only(left: 20, top: 10, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.black
                                .withOpacity(0.5), // set border color
                            width: 1.0), // set border width
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5.0),
                        ), // set rounded corner radius
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Container(
                                color: Colors.white,
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.black.withOpacity(0.5),
                                textStyle: const TextStyle(fontSize: 14),
                              ),
                              onPressed: () {
                                _getFromGallery();
                              },
                              child: const Text('Choose File'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    imageFile != null ?  Container(
                      height: 60,
                      width: 60,
                      child: Image.file(
                        imageFile!,
                        fit: BoxFit.contain,
                        height: 200.0,
                      ) 
                    ):
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        // border: Border.all(),
                        // borderRadius: BorderRadius.all(Radius.circular(80)),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(crushImage),
                        ),
                      ),
                     
                    ),
                    // Expanded(
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(right: 10),
                    //     // child: Text(  image_name.isEmpty ?  'No file choose' : image_name ,
                    //     child: Card(
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(50.0),
                    //         ),
                    //         child: Container(
                    //             width: 60,
                    //             height: 40,
                    //             decoration: BoxDecoration(
                    //               // border: Border.all(),
                    //               borderRadius:
                    //                   BorderRadius.all(Radius.circular(80)),
                    //               image: DecorationImage(
                    //                 fit: BoxFit.fill,
                    //                 image: NetworkImage(
                    //                     widget.crushData.crushImage),
                    //               ),
                    //             ))),
                    //     // style: TextStyle(
                    //     //   color: Colors.black.withOpacity(0.5)
                    //     // ),
                    //   ),
                    // )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: RichText(
                    text: const TextSpan(
                      text: 'Describe more about your Crush',
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
                  width: 330,
                  margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Color(0xffffC4C4C4)
                            .withOpacity(0.5), // set border color
                        width: 1.0), // set border width
                    borderRadius: const BorderRadius.all(
                        Radius.circular(2.0)), // set rounded corner radius
                  ),
                  child: TextField(
                    controller: descriptionController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Label text',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 15),
                  width: 90,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: FlatButton(
                    child: const Text(
                      'Submit',
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
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
