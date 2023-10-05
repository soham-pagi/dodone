import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:collection';
import 'task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [];
  int _remainingTasks = 0;

  TaskData() {
    getTasksFromSharedPreferences();
  }

  void saveTasksToSharedPreferences() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    List<String> jsonList = _tasks.map((task) => task.toJson()).toList();
    pref.setStringList('tasks', jsonList).then((status) {
      if (status) {
        // print('Saved');
      } else {
        // print('Failed to save');
      }
    });
  }

  void getTasksFromSharedPreferences() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var tasks = pref.getStringList('tasks') ?? [];

    try {
      for (var jsonTask in tasks) {
        Map<String, dynamic> decodeTask = jsonDecode(jsonTask);
        var task = Task.fromJson(decodeTask);
        _remainingTasks += task.isDone ? 0 : 1;
        _tasks.add(task);
      }
    } catch(e) {
      // print('Error $e');
    }
  }

  void createTask(name) {
    Task task = Task(name: name);
    _tasks.add(task);
    _remainingTasks++;

    saveTasksToSharedPreferences();

    notifyListeners();
  }

  void updateTask(Task task) {
    _remainingTasks += task.isDone ? 1 : -1;
    task.toggleIsDone();

    saveTasksToSharedPreferences();

    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    _remainingTasks += task.isDone ? 0 : -1;

    saveTasksToSharedPreferences();

    notifyListeners();
  }

  UnmodifiableListView<Task> get allTasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskSize {
    return _tasks.length;
  }

  int get remainingTasks {
    return _remainingTasks;
  }
}