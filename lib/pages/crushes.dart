import 'package:badges/badges.dart';
import 'package:crush/pages/addCrush.dart';
import 'package:flutter/material.dart';

class CrishScreen extends StatefulWidget {
  const CrishScreen({Key? key}) : super(key: key);

  @override
  _CrishScreenState createState() => _CrishScreenState();
}

class _CrishScreenState extends State<CrishScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        // appBar:AppBar(
        //   title: const Text('Contact Us'),
        //    backgroundColor: Colors.amber,
        // ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/banner.png"),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Crush on me crush on you is all about posting your past and present crushes. Come and join to see who had a crush on you.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        height: 1.4, color: Color(0xffffffff), fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Badge(
                      position: BadgePosition.topEnd(top: 1),
                      badgeColor: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                      badgeContent:
                          Text('1', style: TextStyle(color: Colors.white)),
                      child: Container(
                        height: 80,
                        width: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/heart.png"))),
                      ),
                    ),
                  )
                ],
              ),
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddCrushPage()),
            );
            // Add your onPressed code here!
          },
          backgroundColor: Color(0xffffffa616),
          child: const Icon(Icons.add),
        ),
        // floatingActionButton: Container(

        //   child: FloatingActionButton(
        //     onPressed: () {
        //       // Add your onPressed code here!
        //     },
        //     elevation: 0.0,
        //     backgroundColor: Colors.transparent,
        //     child: Badge(
        //         // position: BadgePosition.topEnd(top: 1),
        //         badgeColor: Colors.red,
        //         borderRadius: BorderRadius.circular(8),
        //         badgeContent: Text('1', style: TextStyle(color: Colors.white)),
        //         child: const Icon(Icons.favorite,
        //         size: 40,
        //         )),
        //   ),
        // )
      );
}
