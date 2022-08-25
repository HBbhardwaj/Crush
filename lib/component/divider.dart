import 'package:flutter/material.dart';
class Devider extends StatelessWidget {
  const Devider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
    color: Color(0xffff000000),
    height: 20,
    thickness: 2,
    indent: 10,
    endIndent: 10,
                );
  }
}