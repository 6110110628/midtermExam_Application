import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:midterm_application/task_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore: camel_case_types
class homework extends StatefulWidget {
  const homework({Key? key}) : super(key: key);

  @override
  _homeworkState createState() => _homeworkState();
}

// ignore: camel_case_types
class _homeworkState extends State<homework> {
  late String inputTask;
  late Box<Task> todosBox;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homework Task'),
      ),
      body: ValueListenableBuilder(
          valueListenable: Hive.box<Task>('TODOs').listenable(),
          builder: (context, Box<Task> _notesBox, _) {
            todosBox = _notesBox;
            return ListView.builder(
                itemCount: _notesBox.values.length,
                itemBuilder: (BuildContext context, int index) {
                  final todo = todosBox.getAt(index);
                  return Card(
                      child: ListTile(
                    leading: Icon(
                      Icons.assignment,
                      color: Colors.green,
                    ),
                    title: Text('${todo?.task}'),
                    subtitle: Text('${todo?.date}'),
                    onLongPress: () => todosBox.deleteAt(index),
                    trailing: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ));
                });
          }),
    );
  }
}
