import 'package:flutter/material.dart';
import 'package:teachers/screens/auth/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Fit PRO',
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primarySwatch: Colors.blue,
        canvasColor: Colors.white
      ),
      home: LoginScreen(),
    );
  }
}
