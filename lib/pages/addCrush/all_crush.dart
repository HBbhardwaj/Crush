import 'dart:async';

import 'package:crush/apis/api.dart';
import 'package:crush/modal/crush_model.dart';
import 'package:crush/modal/delete_model.dart';
import 'package:crush/pages/addCrush/edit_crush.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// class crushDetail {
//   final String id = '';
//   final String userid = '' ;
//   final String crush_name = '';
//   final String middle_name = '';
//   final String maiden_name = '';
//    final String married_name = '';
// crush_image: https://crushonmecrushonyou.com/wp-content/uploads/2022/04/image_picker4888938065530674630.jpg",
// description: "jsjsjs jssj jsj",
// date:
// town_city: snnsns
// school_work: snns
//   // const Todo(this.id, this.description);
// }

class Allcrush extends StatefulWidget {
  String email;
  Allcrush(this.email);

  @override
  State<Allcrush> createState() => _AllcrushState(this.email);
}

class _AllcrushState extends State<Allcrush> {
  String email;
  _AllcrushState(this.email);
  late Future<GetCrushModal> crushData;

  String user_Id = '';
  String user_name = '';
  int _Statuscode = 0;
 String selectedId ='';
 Timer? timer;
  // showAlertDialog(BuildContext alartContext) {
  //   AlertDialog alert = AlertDialog(
  //     content: Container(
  //         height: 40,
  //         width: 40,
  //         color: Colors.transparent,
  //         child: const Center(child: CircularProgressIndicator())),
  //   );
  //   showDialog(
  //     barrierDismissible: false,
  //     context: alartContext,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  showAlertDialog(BuildContext context) {
  Widget cancelButton = TextButton(
    child: Text("No",
    style:TextStyle(color: Colors.red)
    ),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text("Yes",
    style: TextStyle(color:Colors.green),
    ),
    onPressed:  () {
      print("++++++++++++++++++++dfsfs++");
      print(selectedId);
      setState(() {
        deleteCrush(selectedId);
      });
         
         Navigator.of(context).pop(true);
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text("Are you sure want to delete it?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

  Future<GetCrushModal> Allcrush() async {
    var request = http.MultipartRequest('POST', Uri.parse(Apis.allCrush));
    request.fields.addAll({'email': email});

    http.Response response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      // Navigator.of(context, rootNavigator: true).pop();
      String jsonString = response.body;
      _Statuscode = response.statusCode;
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      print("call function 33in all===1>>");
      if (jsonMap['status'] == 100) {
        print("data+++++++++++++++add==>>");
        print(jsonMap['data']);
        // Fluttertoast.showToast(
        //     msg: jsonMap['msg'],
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.BOTTOM,
        //     backgroundColor: Colors.grey,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
      } else if (jsonMap['status'] == 101) {
        Fluttertoast.showToast(
            msg: jsonMap['error'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      return GetCrushModal.fromJson(json.decode(response.body));
    } else {
      print(response.body);
    }
    return GetCrushModal.fromJson(jsonDecode(response.body));
  }

    Future<DeleteModal> deleteCrush(id) async {
    var request = http.MultipartRequest('POST', Uri.parse(Apis.deleteCrush));
    request.fields.addAll({'id': id});

    http.Response response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
     
     setState(() {
       crushData = Allcrush();
     });
      //  crushData = Allcrush();
      String jsonString = response.body;
      _Statuscode = response.statusCode;
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      if (jsonMap['status'] == 100) {
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
      return DeleteModal.fromJson(json.decode(response.body));
    } else {
      print(response.body);
    }
    return DeleteModal.fromJson(jsonDecode(response.body));
  }
  void initState() {
    super.initState();
      crushData = Allcrush();

    //   Future.delayed(const Duration(milliseconds: 500), () {
    //   crushData = Allcrush();

    //  });

  }

// void dispose() {
//   timer?.cancel();
//   super.dispose();
// }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FutureBuilder<GetCrushModal>(
          future: crushData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // isLoading = true;
              return ListView.builder(
                 physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(
                      bottom: kFloatingActionButtonMargin + 310),
                  itemCount: snapshot.data!.data.length,
                  itemBuilder: (context, index) {
                    var listItem = snapshot.data!.data[index];
                    print("response data===+++++");
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          elevation: 3,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          // border: Border.all(),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                listItem.crushImage),
                                          ),
                                        ))),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Name:",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(listItem.crushName,
                                            style: TextStyle(fontSize: 18)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Married Name:",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFF000000)
                                                  .withOpacity(0.5)),
                                        ),
                                        Text(
                                          listItem.marriedName,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff000000)
                                                  .withOpacity(0.5)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                 onTap: (() {
                                //   print("+++++++++++++++++++++===>");
                                //   print(listItem.id);
                                // deleteCrush(listItem.id);
                                showAlertDialog(context);
                                  setState(() {
                                    selectedId = listItem.id;
                                  });
                                }),
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.black,
                                    size: 21.0,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (() {
                                  print("+++++++++++++++++++++===>");
                                  print(listItem.crushName);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EditCrush(crushData: listItem)),
                                  );
                                }),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Image.asset("assets/images/Edit.png"),
                                ),
                              )
                            ],
                          )),
                    );
                  });
            } else {
              // return const Center(child: CircularProgressIndicator());
              // return
              //CircularProgressIndicator();
            }
            return _Statuscode == 200
                ? Text("No Data")
                : CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
