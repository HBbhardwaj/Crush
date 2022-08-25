import 'dart:convert';

import 'package:crush/apis/api.dart';
import 'package:crush/modal/message_modal.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Inbox extends StatefulWidget {
  var userId;
   Inbox({Key? key, required this.userId}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState(this.userId);
}

class _InboxState extends State<Inbox> {
var userId;
_InboxState(this.userId);

  late Future<MessageModal> msghData;
  
int _Statuscode = 0;
void initState() {
    super.initState();
      msghData = Allmsg();
  }

 Future<MessageModal> Allmsg() async {
    var request = http.MultipartRequest('POST', Uri.parse(Apis.get_message));
   request.fields.addAll({
  'sender_id': userId
});

    http.Response response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      // Navigator.of(context, rootNavigator: true).pop();
      String jsonString = response.body;
  
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
      return MessageModal.fromJson(json.decode(response.body));
    } else {
      print(response.body);
    }
    return MessageModal.fromJson(jsonDecode(response.body));
  }


  @override

  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FutureBuilder<MessageModal>(
          future: msghData,
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
                    print("response data===+++++${listItem.message}");
                    return Padding(
                      padding: const EdgeInsets.all(4),
                      child: Card(
                        color: Color.fromARGB(255, 255, 255, 255),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                
                                  Container(
                                    margin:  const EdgeInsets.symmetric(vertical: 10.0),
                                    width: 250,
                                    child: Text(
                                      listItem.name ?? "Test name",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    margin:  const EdgeInsets.only(bottom: 10.0),
                                    width: 250,
                                    child: Text(
                                      listItem.subject,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style:const TextStyle(fontSize: 16, color:  Color(0xffA9A9A9)),
                                    ),
                                  ),
                                  Container(
                                    margin:  const EdgeInsets.only(bottom: 10.0),
                                    width: 250,
                                    child: Text(
                                      listItem.message,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style:const TextStyle(fontSize: 16, color:  Color(0xffA9A9A9)),
                                    ),
                                  ),
                               
                                ],
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: (() {
                                    // print("+++++++++++++++++++++===>");
                                    // print(listItem.crushName);
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           EditCrush(crushData: listItem)),
                                    // );
                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>))
                                  }),
                                  child: Container(
                                   height: 70,
                                    
                                    child: Text(
                                      listItem.dateSent,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: const Color.fromARGB(186, 231, 144, 4)
                                              .withOpacity(0.5)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
