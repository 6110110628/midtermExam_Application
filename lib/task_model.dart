import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  String? task;
  @HiveField(1)
  DateTime? date;
  @HiveField(2)
  bool homework;
  @HiveField(3)
  bool housework;
  @HiveField(4)
  bool sport;

  Task({
    @required this.task,
    @required this.date,
    this.homework = false,
    this.housework = false,
    this.sport = false,
  });
}
