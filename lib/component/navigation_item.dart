import 'package:flutter/material.dart';
class NavItem extends StatelessWidget {
  const NavItem({Key? key, required this.title, required this.leading, required this.widget}) : super(key: key);
  final String title;
  final Widget leading;
  final Widget widget;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: leading,
      onTap: () {
        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => this.widget),

        );

      },
    );
  }
}