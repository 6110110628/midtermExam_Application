import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:midterm_application/screens/homework.dart';
import 'package:midterm_application/screens/housework.dart';
import 'package:midterm_application/screens/sport.dart';
import 'my_home_page.dart';
import 'task_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final applicatonDocumentDir =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(applicatonDocumentDir.path);
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('TODOs');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Last Time',
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      routes: {
        '/all': (context) => MyHomePage(),
        '/homework': (context) => homework(),
        '/housework': (context) => housework(),
        '/sport': (context) => sport(),
      },
    );
  }
}
