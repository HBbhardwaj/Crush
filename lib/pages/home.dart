import 'package:badges/badges.dart';
import 'package:crush/component/divider.dart';
import 'package:crush/pages/TermsAndservice.dart';
import 'package:crush/pages/addCrush.dart';
import 'package:crush/pages/contact.dart';
import 'package:crush/pages/crushes.dart';
import 'package:crush/pages/login.dart';
import 'package:crush/pages/members.dart';
import 'package:crush/pages/policy.dart';
import 'package:crush/pages/profile.dart';
import 'package:crush/pages/workScreen.dart';
import 'package:flutter/material.dart';
import 'package:crush/pages/about.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../component/navigation_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  String AppbarTitle = 'Crush';
  String user_Id = '';
  String user_name = '';
  String email = '';

  logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();

    if (!preferences.containsKey('user_id')) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Login()));
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        AppbarTitle = 'Crush';
      } else if (_selectedIndex == 1) {
        AppbarTitle = 'Members';
      } else if (_selectedIndex == 2) {
        AppbarTitle = 'Contact Us';
      }
    });
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
    return Scaffold(
      appBar: AppBar(
        title: Text(AppbarTitle),
        backgroundColor: Color(0xFFFFff9f04),
        actions: <Widget>[
          InkWell(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Profile(userId : user_Id)),
              )
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Badge(
                position: BadgePosition.topEnd(top: 1),
                badgeColor: Colors.red,
                borderRadius: BorderRadius.circular(8),
                badgeContent: Text('1', style: TextStyle(color: Colors.white)),
                child: Image.asset(
                  'assets/images/profile.png',
                  // fit: BoxFit.none,
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 12, top: 12, bottom: 12),
            child: InkWell(
              onTap: () => {logout()},
              child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      'assets/images/logout.png',
                      // fit: BoxFit.none,
                    ),
                  )),
            ),
          ), // here add notification icon

          // IconButton(
          //   icon: Icon(
          //     Icons.settings,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     // do something
          //   },
          // )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView(
                children: [
                  NavItem(
                      title: "About Us",
                      leading: Image.asset("assets/images/about.png"),
                      widget: About()),
                  const Devider(),
                  NavItem(
                      title: "Privacy Policy",
                      leading: Image.asset("assets/images/Group.png"),
                      widget: policy()),
                  const Devider(),
                  NavItem(
                      title: "Terms of service",
                      leading: Image.asset("assets/images/service.png"),
                      widget: TermsAndservice()),
                  const Devider(),
                  NavItem(
                      title: "How does it work?",
                      leading: Image.asset("assets/images/work.png"),
                      widget: workScreen()),
                  const Devider(),
                  NavItem(
                      title: "Contact Us",
                      leading: Image.asset("assets/images/contact.png"),
                      widget: ContactScreen(screenkey: "1")),
                  const Devider()
                ],
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          getCurrentPage(_selectedIndex),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFFff9f04),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'CRUSHES',
            // backgroundColor: Color(0xFFFFA406),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_rounded),
            label: 'MEMBERS',
            // backgroundColor: Color(0xFFFFA406),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smartphone_rounded),
            label: 'CONTACT',
            // backgroundColor: Color(0xFFFFA406),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        iconSize: 30,
        //  fixedColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}

getCurrentPage(int index) {
  if (index == 0) {
    return const CrishScreen();
  } else if (index == 1) {
    return const MemberScreen();
  } else if (index == 2) {
    return ContactScreen(
      screenkey: "0",
    );
  }
}
