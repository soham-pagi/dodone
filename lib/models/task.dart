import 'dart:convert';

class Task {
  String title;
  String description;
  bool isDone;

  Task({required this.title, this.description = '', this.isDone = false});

  void toggleIsDone() {
    isDone = !isDone;
  }

  String toJson() {
    return jsonEncode({
      "name": title,
      "description": description,
      "isDone": isDone
    });
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['name'],
      description: json['description'],
      isDone: json['isDone']
    );
  }
}