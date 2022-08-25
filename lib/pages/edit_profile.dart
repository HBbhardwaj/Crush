import 'dart:convert';

import 'package:crush/apis/api.dart';
import 'package:crush/component/profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../modal/edit_modal.dart';

class Editprofile extends StatefulWidget {
  var userData;

  Editprofile({Key? key, required this.userData}) : super(key: key);

  @override
  State<Editprofile> createState() => _EditprofileState(this.userData);
}

class _EditprofileState extends State<Editprofile> {
  var userData;
  String userId = '';
  _EditprofileState(this.userData);
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

  TextEditingController nameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController maidenNameController = TextEditingController();
  TextEditingController marriedNameController = TextEditingController();
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController maritalController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController schoolNamesController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController youthController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  void initState() {
    print("++++++++++++++++++++++++***++++");
    print(userData.name);
    super.initState();
    setState(() {
      userId = userData.id;
      nameController.text = userData.name;
      middleNameController.text = userData.middleName;
      maidenNameController.text = userData.maidenName;
      marriedNameController.text = userData.marriedName;
      schoolNameController.text = userData.schoolName;
      ageController.text = userData.age;
      maritalController.text = userData.maritalStatus;
      nickNameController.text = userData.nickName;
      schoolNamesController.text = userData.schoolNames;
      collegeController.text = userData.collegeName;
      youthController.text = userData.youth;
      cityController.text = userData.city;
    });
  }

  Future<EditModal> edit_profile() async {
    var request = http.MultipartRequest('POST', Uri.parse(Apis.edit_Profile));
    request.fields.addAll({
      'id': userData.id,
      'name': nameController.text,
      'middle_name': middleNameController.text,
      'maiden_name': maidenNameController.text,
      'married_name': marriedNameController.text,
      'nick_name': nickNameController.text,
      'school_name': schoolNameController.text,
      'age': ageController.text,
      'marital_status': maritalController.text,
      'school_names': schoolNamesController.text,
      'college_name': collegeController.text,
      'youth': youthController.text,
      'city': cityController.text
    });

    //  imageFile != null ? request.files
    //     .add(await http.MultipartFile.fromPath('crush_image', imagelink)) : null;

    http.Response response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      // Navigator.of(context, rootNavigator: true).pop();
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

          nameController.text = '';
          middleNameController.text = '';
          maidenNameController.text = '';
          marriedNameController.text = '';
          schoolNameController.text = '';
          ageController.text = '';
          maritalController.text = '';
          nickNameController.text = '';
          schoolNamesController.text = '';
          collegeController.text = '';
          youthController.text = '';
          cityController.text = '';
        } else if (jsonMap['status'] == 101) {
          Fluttertoast.showToast(
              msg: jsonMap['error'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Color.fromARGB(255, 31, 23, 23),
              textColor: Colors.white,
              fontSize: 16.0);
        }
      } catch (e) {
        print("exception+++++++++++++++++++++++++++++++++++");
        print(e);
      }
      return EditModal.fromJson(json.decode(response.body));
    } else {
      print(response.body);
      print('server error++++++++++++');
    }
    return EditModal.fromJson(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Color(0xFFFFff9f04),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
          child: Card(
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(alignment: Alignment.center, child: ProfilePic()),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: RichText(
                    text: const TextSpan(
                      text: 'Name',
                      style: TextStyle(color: Colors.black, fontSize: 16),
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
                        color: const Color(0xffffC4C4C4)
                            .withOpacity(0.5), // set border color
                        width: 1.0), // set border width
                    borderRadius: const BorderRadius.all(
                        Radius.circular(2.0)), // set rounded corner radius
                  ),
                  child: TextField(
                    controller: nameController,
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
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  width: 330,
                  margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color(0xffffC4C4C4)
                            .withOpacity(0.5), // set border color
                        width: 1.0), // set border width
                    borderRadius: const BorderRadius.all(
                        Radius.circular(2.0)), // set rounded corner radius
                  ),
                  child: TextField(
                    controller: middleNameController,
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
                      text: 'Maiden Name',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  width: 330,
                  margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color(0xffffC4C4C4)
                            .withOpacity(0.5), // set border color
                        width: 1.0), // set border width
                    borderRadius: const BorderRadius.all(
                        Radius.circular(2.0)), // set rounded corner radius
                  ),
                  child: TextField(
                    controller: maidenNameController,
                    decoration: const InputDecoration(
                      isDense: true,
                      hintText: 'Label text',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: RichText(
                    text: const TextSpan(
                      text: 'Married Name',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  width: 330,
                  margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color(0xffffC4C4C4)
                            .withOpacity(0.5), // set border color
                        width: 1.0), // set border width
                    borderRadius: const BorderRadius.all(
                        Radius.circular(2.0)), // set rounded corner radius
                  ),
                  child: TextField(
                    controller: marriedNameController,
                    decoration: const InputDecoration(
                      isDense: true,
                      hintText: 'Label text',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: RichText(
                    text: const TextSpan(
                      text: 'School Name/town/city/state',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  width: 330,
                  margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color(0xffffC4C4C4)
                            .withOpacity(0.5), // set border color
                        width: 1.0), // set border width
                    borderRadius: const BorderRadius.all(
                        Radius.circular(2.0)), // set rounded corner radius
                  ),
                  child: TextField(
                    controller: schoolNameController,
                    decoration: const InputDecoration(
                      isDense: true,
                      hintText: 'Label text',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: RichText(
                    text: const TextSpan(
                      text: 'Age',
                      style: TextStyle(color: Colors.black, fontSize: 16),
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
                        color: const Color(0xffffC4C4C4)
                            .withOpacity(0.5), // set border color
                        width: 1.0), // set border width
                    borderRadius: const BorderRadius.all(
                        Radius.circular(2.0)), // set rounded corner radius
                  ),
                  child: TextField(
                    controller: ageController,
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
                      text: 'Marital Status',
                      style: TextStyle(color: Colors.black, fontSize: 16),
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
                    controller: maritalController,
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
                      text: 'Nick Name',
                      style: TextStyle(color: Colors.black, fontSize: 16),
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
                        color: const Color(0xffffC4C4C4)
                            .withOpacity(0.5), // set border color
                        width: 1.0), // set border width
                    borderRadius: const BorderRadius.all(
                        Radius.circular(2.0)), // set rounded corner radius
                  ),
                  child: TextField(
                    controller: nickNameController,
                    decoration: const InputDecoration(
                      isDense: true,
                      hintText: 'Label text',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: RichText(
                    text: const TextSpan(
                      text: 'School Name',
                      style: TextStyle(color: Colors.black, fontSize: 16),
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
                        color: const Color(0xffffC4C4C4)
                            .withOpacity(0.5), // set border color
                        width: 1.0), // set border width
                    borderRadius: const BorderRadius.all(
                        Radius.circular(2.0)), // set rounded corner radius
                  ),
                  child: TextField(
                    controller: schoolNamesController,
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
                      text: 'College Name',
                      style: TextStyle(color: Colors.black, fontSize: 16),
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
                    controller: collegeController,
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
                      text: 'where you grew up in their youth?',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  width: 330,
                  margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color(0xffffC4C4C4)
                            .withOpacity(0.5), // set border color
                        width: 1.0), // set border width
                    borderRadius: const BorderRadius.all(
                        Radius.circular(2.0)), // set rounded corner radius
                  ),
                  child: TextField(
                    controller: youthController,
                    decoration: const InputDecoration(
                      isDense: true,
                      hintText: 'Label text',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: RichText(
                    text: const TextSpan(
                      text:
                          'Your Favourite Hangouts/party places/town/city/state',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  width: 330,
                  margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color(0xffffC4C4C4)
                            .withOpacity(0.5), // set border color
                        width: 1.0), // set border width
                    borderRadius: const BorderRadius.all(
                        Radius.circular(2.0)), // set rounded corner radius
                  ),
                  child: TextField(
                    controller: cityController,
                    decoration: const InputDecoration(
                      isDense: true,
                      hintText: 'Label text',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(left: 20, top: 10),
                //   child: RichText(
                //     text: const TextSpan(
                //       text: 'Crush Picture',
                //       style: TextStyle(color: Colors.black),
                //       children: <TextSpan>[
                //         TextSpan(
                //             text: ' *',
                //             style: TextStyle(
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.yellow)),
                //       ],
                //     ),
                //   ),
                // ),
                // Row(
                //   children: [
                //     Container(
                //       width: 140,
                //       height: 32,
                //       alignment: Alignment.center,
                //       margin: const EdgeInsets.only(
                //           left: 20, top: 10, right: 10),
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //         border: Border.all(
                //             color:
                //                 Colors.black.withOpacity(0.5), // set border color
                //             width: 1.0), // set border width
                //         borderRadius: const BorderRadius.all(
                //             Radius.circular(
                //                 5.0),
                //                 ), // set rounded corner radius
                //       ),
                //       child: ClipRRect(
                //         borderRadius: BorderRadius.circular(4),
                //         child: Stack(
                //           children: <Widget>[
                //             Positioned.fill(
                //               child: Container(
                //                 color: Colors.white,
                //               ),
                //             ),
                //             TextButton(
                //               style: TextButton.styleFrom(
                //                 primary: Colors.black.withOpacity(0.5),
                //                 textStyle:
                //                     const TextStyle(fontSize: 14),
                //               ),
                //               onPressed: () {
                //                 // _getFromGallery();
                //               },
                //               child: const Text('Choose File'),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Padding(
                //         padding: const EdgeInsets.only(right: 10),

                //         // child: Text(  image_name.isEmpty ?  'No file choose' : image_name ,
                //          child: Text('image',
                //         style: TextStyle(
                //           color: Colors.black.withOpacity(0.5)
                //         ),
                //         ),
                //       ),
                //     )
                //   ],
                // ),
                // Padding(
                //   padding: EdgeInsets.only(left: 20, top: 10),
                //   child: RichText(
                //     text: const TextSpan(
                //       text: 'Describe more about your Crush',
                //       style: TextStyle(color: Colors.black),
                //       children: <TextSpan>[
                //         TextSpan(
                //             text: ' *',
                //             style: TextStyle(
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.yellow)),
                //       ],
                //     ),
                //   ),
                // ),
                // Container(
                //   width: 330,
                //   margin: const EdgeInsets.only(
                //       left: 20, top: 10, right: 20),
                //   padding: EdgeInsets.only(left: 10),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     border: Border.all(
                //        color: Color(
                //             0xffffC4C4C4).withOpacity(0.5), // set border color
                //         width: 1.0), // set border width
                //     borderRadius: const BorderRadius.all(
                //         Radius.circular(2.0)), // set rounded corner radius
                //   ),
                //   child: TextField(
                //     // controller: descriptionController,
                //     maxLines: 5,
                //     decoration: InputDecoration(
                //       isDense: true,
                //       hintText: 'Label text',
                //       border: InputBorder.none,
                //     ),
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 15),
                  width: 150,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
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
                      edit_profile();
                      FocusScope.of(context).requestFocus(new FocusNode());
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
