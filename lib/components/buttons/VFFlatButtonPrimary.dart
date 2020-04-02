import 'package:flutter/material.dart';

class VFFlatButtonPrimary extends StatelessWidget {

  /// on press method
  final Function onPressed;

  /// button text
  final String text;

  VFFlatButtonPrimary(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      child: Text(text, style: TextStyle(color: Colors.white),),
      onPressed: onPressed,
      color: Colors.red,
    );
  }
}
