import 'package:crush/pages/addCrush/all_crush.dart';
import 'package:crush/pages/addCrush/create_crush.dart';
import 'package:crush/pages/addCrush/edit_crush.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCrushPage extends StatefulWidget {
  const AddCrushPage({Key? key}) : super(key: key);

  @override
  State<AddCrushPage> createState() => _AddCrushPageState();
}

class _AddCrushPageState extends State<AddCrushPage> {
   String user_Id = '';
  String user_name = '';
  String email = '';
 
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a crush"),
        backgroundColor: Color(0xFFFFff9f04),
      ),
      body: SingleChildScrollView(
        child: Container(
          child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: <Widget>[
            DefaultTabController(
              length: 4, // length of tabs
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: const TabBar(
                      isScrollable: true,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black,
                      indicatorColor:  Color(0xFFFFff9f04),
                      tabs: [
                        Tab(text: 'Add Crush'),
                        Tab(text: 'All Crush'),
                        Tab(text: 'Started By Me'),
                        Tab(text: 'My Groups'),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height +200,
                    // height: 660, //height of TabBarView
                    child: TabBarView(
                      children: <Widget>[
                        CreateCrush(),
                        Allcrush(this.email),
                        Container(
                          child: const Center(
                            child: Text('Display Tab 2',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Container(
                          child: const Center(
                            child: Text('Display Tab 4',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                        ),
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

