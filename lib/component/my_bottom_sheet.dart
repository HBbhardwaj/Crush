import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {

  final Function(String)? callBack;
  const MyBottomSheet({Key? key, this.callBack}) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
      print("++++++++++++++++++++++++++++++");
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('This field can be seen by :'),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              callBack!('Everuone');
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Text('Everyone'),
            ),
          ),
          ListTile(
            title: const Text('Only Me'),
            leading: Radio(
              value: 1,
              groupValue: 'type',
              onChanged: (value) {
                callBack!('OnlyMe');
                // setState(() {
                //   _site = value;
                // });
              },
            ),
          ),
          ListTile(
            title: const Text('All Members'),
            leading: Radio(
              value: 1,
              groupValue: 'type',
              onChanged: (value) {
                callBack!('AllMembers');
                // setState(() {
                //   _site = value;
                // });
              },
            ),
          ),
          ListTile(
            title: const Text('My friends'),
            leading: Radio(
              value: 1,
              groupValue: 'type',
              onChanged: (value) {
                callBack!('MyFriends');
                // setState(() {
                //   _site = value;
                // });
              },
            ),
          ),
        ],
      ),
    );
  }
}
