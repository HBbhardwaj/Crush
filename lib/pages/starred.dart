import 'package:flutter/material.dart';

class Starred extends StatefulWidget {
  const Starred({ Key? key }) : super(key: key);

  @override
  State<Starred> createState() => _StarredState();
}

class _StarredState extends State<Starred> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Starred'),
    );
  }
}