import 'package:badges/badges.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class MemberScreen extends StatefulWidget {
  const MemberScreen({Key? key}) : super(key: key);

  @override
  _MemberScreenState createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) => Scaffold(
          body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 6, right: 6),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffffc4c4c4)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'All Members',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Badge(
                          toAnimate: false,
                          shape: BadgeShape.square,
                          badgeColor: Color(0xffffffaf24),
                          borderRadius: BorderRadius.circular(8),
                          badgeContent:
                              Text('65', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Color(0xffffC4C4C4)), // set border width
                          borderRadius: BorderRadius.all(Radius.circular(
                              5.0)), // set rounded corner radius
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Search Members',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 78,
                      child: FlatButton(
                        child: const Text(
                          'SEARCH',
                          style: TextStyle(fontSize: 12.0),
                        ),
                        color: Colors.black,
                        textColor: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 6, right: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 10),
                  height: 50,
                  child: const Text(
                    'Order By:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  width: 140,
                  height: 50,
                  alignment: Alignment.center,
                  child: DropdownButtonFormField2(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    isExpanded: true,
                    hint: const Text(
                      'Last Active',
                      style: TextStyle(fontSize: 14),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    iconSize: 30,
                    buttonHeight: 30,
                    buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    items: genderItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select gender.';
                      }
                    },
                    onChanged: (value) {
                      //Do something when changing the item if you want.
                    },
                    onSaved: (value) {
                      selectedValue = value.toString();
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 6, top: 16, right: 6),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      // color: Colors.yellow,
                      height: 80,
                      child: Image.asset('assets/images/a.png')),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Container(
                            //  color: Colors.blue,
                            width: MediaQuery.of(context).size.width,
                            child: const Text(
                              'Lorem Ipsum',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            //  color: Colors.yellow,
                            width: MediaQuery.of(context).size.width,
                            child: const Text(
                              'Lorem Ipsum is simply.',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 6, top: 16, right: 6),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      // color: Colors.yellow,
                      height: 80,
                      child: Image.asset('assets/images/b.png')),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Container(
                            //  color: Colors.blue,
                            width: MediaQuery.of(context).size.width,
                            child: const Text(
                              'Lorem Ipsum',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            //  color: Colors.yellow,
                            width: MediaQuery.of(context).size.width,
                            child: const Text(
                              'Lorem Ipsum is simply.',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 6, top: 16, right: 6),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      // color: Colors.yellow,
                      height: 80,
                      child: Image.asset('assets/images/x.png')),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Container(
                            //  color: Colors.blue,
                            width: MediaQuery.of(context).size.width,
                            child: const Text(
                              'Lorem Ipsum',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            //  color: Colors.yellow,
                            width: MediaQuery.of(context).size.width,
                            child: const Text(
                              'Lorem Ipsum is simply.',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 6, top: 16, right: 6),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      // color: Colors.yellow,
                      height: 80,
                      child: Image.asset('assets/images/y.png')),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Container(
                            //  color: Colors.blue,
                            width: MediaQuery.of(context).size.width,
                            child: const Text(
                              'Lorem Ipsum',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            //  color: Colors.yellow,
                            width: MediaQuery.of(context).size.width,
                            child: const Text(
                              'Lorem Ipsum is simply.',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 6, top: 16, right: 6),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      // color: Colors.yellow,
                      height: 80,
                      child: Image.asset('assets/images/z.png')),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Container(
                            //  color: Colors.blue,
                            width: MediaQuery.of(context).size.width,
                            child: const Text(
                              'Lorem Ipsum',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            //  color: Colors.yellow,
                            width: MediaQuery.of(context).size.width,
                            child: const Text(
                              'Lorem Ipsum is simply.',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 6, top: 16, right: 6),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      // color: Colors.yellow,
                      height: 80,
                      child: Image.asset('assets/images/a.png')),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Container(
                            //  color: Colors.blue,
                            width: MediaQuery.of(context).size.width,
                            child: const Text(
                              'Lorem Ipsum',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            //  color: Colors.yellow,
                            width: MediaQuery.of(context).size.width,
                            child: const Text(
                              'Lorem Ipsum is simply.',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only( right: 6),
                  child: Text('Viewing 1 - 12 of 89 active members',
                  style: TextStyle(
                    fontSize: 12
                  ),
                  ),
                ),
                Container(
                  child: Container(
                    alignment: Alignment.center,
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                        color: Color(0xffffffa406),
                        borderRadius: BorderRadius.circular(100)
                        //more than 50% of width makes circle
                        ),
                    child: const Text(
                      '1',
                      style: TextStyle(color: Colors.white,fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    alignment: Alignment.center,
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                        color: Color(0xffff8e8e8e),
                        borderRadius: BorderRadius.circular(100)
                        //more than 50% of width makes circle
                        ),
                    child: const Text(
                      '2',
                      style: TextStyle(color: Colors.white,fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const Text(
                  '....',
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                     padding: EdgeInsets.only(left: 6),
                  child: Container(
                    alignment: Alignment.center,
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                        color: Color(0xffff8e8e8e),
                        borderRadius: BorderRadius.circular(100)
                        //more than 50% of width makes circle
                        ),
                    child: const Text(
                      '8',
                      style: TextStyle(color: Colors.white,fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    child: const Icon(
                      Icons.arrow_forward_outlined ,
                      color: Colors.grey,
                      size: 30.0,
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ));
}
