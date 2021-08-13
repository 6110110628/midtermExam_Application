import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'task_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String inputTask;

  late Task _task;

  late Box<Task> todosBox;

  void _addTodo(Task inputTodo) {
    todosBox.add(Task(task: inputTodo.task, date: inputTodo.date));
  }

  @override
  Widget build(BuildContext context) {
    // notesBox.clear();
    return Scaffold(
      appBar: AppBar(
        title: Text('Last Time'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Category',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.format_list_bulleted,
                color: Colors.green,
              ),
              title: Text('All'),
              onTap: () {
                Navigator.pushNamed(context, '/all');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.border_color,
                color: Colors.green,
              ),
              title: Text('Homework'),
              onTap: () {
                Navigator.pushNamed(context, '/homework');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.cleaning_services,
                color: Colors.green,
              ),
              title: Text('Housework'),
              onTap: () {
                Navigator.pushNamed(context, '/housework');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.pool,
                color: Colors.green,
              ),
              title: Text('Sport'),
              onTap: () {
                Navigator.pushNamed(context, '/sport');
              },
            ),
          ],
        ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _simpleDialog(),
        tooltip: 'AddNewTODOTask',
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  _simpleDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Add Todo'),
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'title',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) => inputTask = value,
                    ),
                    SimpleDialogOption(
                      onPressed: () {
                        _task = Task(task: inputTask, date: DateTime.now());
                        _task.homework = true;
                      },
                      child: const Text('Homework'),
                    ),
                    SimpleDialogOption(
                      onPressed: () {
                        _task = Task(task: inputTask, date: DateTime.now());
                        _task.housework = true;
                      },
                      child: const Text('Housework'),
                    ),
                    SimpleDialogOption(
                      onPressed: () {
                        _task = Task(task: inputTask, date: DateTime.now());
                        _task.sport = true;
                      },
                      child: const Text('Sport'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.green,
                            ),
                            onPressed: () {
                              _task =
                                  Task(task: inputTask, date: DateTime.now());
                              _addTodo(_task);
                              Navigator.pop(context);
                            },
                            child: Text('Add'),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.green,
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: Text('Cancel'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // remove the deleted index holes/slots from database
    // to free up the space
    todosBox.compact();

    todosBox.close();
    super.dispose();
  }
}
