
import 'dart:convert';
import 'dart:developer';

import 'package:crush/apis/api.dart';
import 'package:crush/component/profile_pic.dart';
import 'package:crush/modal/profile_modal.dart';
import 'package:crush/pages/edit_profile.dart';
import 'package:crush/pages/massege.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  var userId;
   Profile({Key? key,required this.userId}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState(this.userId);
}


class _ProfileState extends State<Profile> {
  var userId;
  _ProfileState(this.userId);
  String user_Id = '';

 late Future<ProfileModal> profileData;
  
Future<ProfileModal> getProfile() async {
    var request = http.MultipartRequest('POST', Uri.parse(Apis.getProfile));
    request.fields.addAll({'id': userId});
    http.Response response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      setState(() {
        
      });
      // Navigator.of(context, rootNavigator: true).pop();
      String jsonString = response.body;
      Map<String, dynamic> jsonMap = json.decode(jsonString);
       print(jsonString);
      if (jsonMap['status'] == 100) {
      print("**************************");

        Fluttertoast.showToast(
            msg: jsonMap['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (jsonMap['status'] == 101) {
        Fluttertoast.showToast(
            msg: jsonMap['error'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    
      return ProfileModal.fromJson(json.decode(response.body));

    } else {
      print(response.body);
    }
    return ProfileModal.fromJson(jsonDecode(response.body));
  }

void initState (){
  profileData = getProfile();
super.initState();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xffff9f04),
      ),
      body: Container(
        child: SingleChildScrollView(
          child:FutureBuilder<ProfileModal>(
            future: profileData,
            builder: (context, snapshot){
              var profileinfo = snapshot.data?.data;
                if(snapshot.hasData){
                  return  Column(
               children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 46,
                    width: 46,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(color: Colors.white),
                        ),
                        primary: Colors.white,
                        backgroundColor: Color(0xffffffa406),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  Editprofile(userData:profileinfo)),
                        ).then((value) => profileData = getProfile());
                        //  setState(() {});
                      },
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
              ),
              // ProfilePic(),
              SizedBox(
                height: 115,
                width: 115,
                child: Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/images/b.png"),
                    ),
                   
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           Text(
                            'Name : ',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                           Text(profileinfo!.name,
                            style: const TextStyle(
                              fontSize: 20,
                              // color: Colors.grey
                            ),
                          )
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Email : ',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          Text(
                            profileinfo.useremail,
                            style: const TextStyle(
                              fontSize: 20,
                              // color: Colors.grey
                            ),
                          )
                        ]),
                      
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Message(userId: userId)),
                        )
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18,right:18),
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('Message',
                              style: TextStyle(
                                fontSize: 20
                              ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ]
            );
                } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
                 return SizedBox(
                   height: MediaQuery.of(context).size.height,
                   width: MediaQuery.of(context).size.width,
                   child: const Center(child: CircularProgressIndicator()));
            },
            
          ),
        ),
      ),
    );
  }
}
