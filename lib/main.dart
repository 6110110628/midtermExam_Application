import 'package:flutter/material.dart';
import 'package:midterm_application/launcher.dart';
import 'package:midterm_application/screens/search.dart';
import 'package:midterm_application/screens/about.dart';
import 'package:midterm_application/screens/settings.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('midterm');
  WidgetsFlutterBinding.ensureInitialized();
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
        body: launcher(),
      ),
      routes: {
        '/launcher': (context) => launcher(),
        '/search': (context) => search(),
        '/about': (context) => about(),
        '/settings': (context) => settings(),
      },
    );
  }
}
