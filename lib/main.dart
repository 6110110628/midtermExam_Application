import 'package:flutter/material.dart';
import 'package:midterm_application/screens/index.dart';
import 'package:midterm_application/screens/search.dart';
import 'package:midterm_application/screens/about.dart';
import 'package:midterm_application/screens/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Midterm App',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        body: index(),
      ),
      routes: {
        '/index': (context) => index(),
        '/search': (context) => search(),
        '/about': (context) => about(),
        '/settings': (context) => settings(),
      },
    );
  }
}
