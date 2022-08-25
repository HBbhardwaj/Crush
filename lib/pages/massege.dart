import 'package:crush/pages/compose.dart';
import 'package:crush/pages/inbox.dart';
import 'package:crush/pages/sent.dart';
import 'package:crush/pages/starred.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  var userId;
   Message({Key? key, required this.userId}) : super(key: key);

  @override
  State<Message> createState() => _MessageState(this.userId);
}

class _MessageState extends State<Message> {
  var userId;
  _MessageState(this.userId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Message"),
        backgroundColor: Color(0xFFFFff9f04),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                DefaultTabController(
                  length: 4, // length of tabs
                  initialIndex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          height: 30,
                          child: const TabBar(
                            indicator: BoxDecoration(
                                // Creates border
                                color: Color(0xFFFFff9f04)),
                            isScrollable: true,
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.black,
                            indicatorColor: Color(0xFFFFff9f04),
                            indicatorWeight: 4,
                            // padding: EdgeInsets.only(left: 10),
                            indicatorPadding:
                                EdgeInsets.only(left: 10, right: 10),
                            labelPadding:
                                EdgeInsets.only(left: 20, right: 30,top: 5),
                            tabs: [
                              Tab(text: 'Inbox'),
                              Tab(text: 'Starred'),
                              Tab(text: 'Sent'),
                              Tab(text: 'Compose'),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height + 200,
                        // height: 660, //height of TabBarView
                        child: TabBarView(
                          children: <Widget>[
                            Inbox(userId:userId),
                            Starred(),
                            Sent(userId:userId),
                            Compose()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
