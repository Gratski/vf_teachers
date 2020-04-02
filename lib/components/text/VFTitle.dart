import 'package:flutter/material.dart';

class VFTitle extends StatelessWidget {

  final String text;

  VFTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20
      ),
    );
  }
}
