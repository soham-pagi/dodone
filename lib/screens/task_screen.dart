import 'package:flutter/material.dart';
import 'package:my_todo/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var taskData = Provider.of<TaskData>(context);

    return  Flexible(
      flex: 4,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))
        ),
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 15),
          itemBuilder: (context, index) {
            final task = taskData.allTasks[index];

            return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 25.0),
              title: Text(task.name, style: TextStyle(decoration: task.isDone ? TextDecoration.lineThrough : null)),
              trailing: Checkbox(
                onChanged: (newValue) {
                  taskData.updateTask(task);
                },
                value: task.isDone,
              ),
              onLongPress: () {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.taskSize,
        ),
      ),
    );
  }
}
