import 'package:flutter/material.dart';

class ListObjectInSchool extends StatefulWidget {
  const ListObjectInSchool({
    super.key,
    required this.nameObject,
    required this.fc,
    required this.color,
  });

  final String nameObject;
  final Function fc;
  final Color color;

  @override
  State<ListObjectInSchool> createState() => _ListObjectInSchoolState();
}

class _ListObjectInSchoolState extends State<ListObjectInSchool> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(widget.color),
        ),
        onPressed: () {
          widget.fc();
          setState(() {});
        },
        child: Text(widget.nameObject, textAlign: TextAlign.center),
      ),
    );
  }
}
