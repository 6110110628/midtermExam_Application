import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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
    );
  }
}
