import 'dart:convert';

class Task {
  String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  void toggleIsDone() {
    isDone = !isDone;
  }

  String toJson() {
    return jsonEncode({
      "name": name,
      "isDone": isDone
    });
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      name: json['name'],
      isDone: json['isDone']
    );
  }
}