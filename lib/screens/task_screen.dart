import 'package:flutter/material.dart';
import 'package:my_todo/models/task_data.dart';
import 'package:provider/provider.dart';

import 'add_or_update_task_screen.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var taskData = Provider.of<TaskData>(context);
    double textScaleFactor = MediaQuery.textScaleFactorOf(context);

    return  Container(
      decoration: const BoxDecoration(
        color: Color(0xFFD3D4D8), // light grey
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))
      ),
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 20.0),
        itemBuilder: (BuildContext context, int index) {
          final task = taskData.allTasks[index];

          return GestureDetector(
            onLongPress: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return AddOrUpdateTaskScreen(addScreen: false, task: task, title: task.title, description: task.description);
                  }
              );
            },
            child: ExpansionTile(
              expandedAlignment: Alignment.centerLeft,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              textColor: const Color(0xFF00ADB5),
              key: Key(index.toString()),
              tilePadding: const EdgeInsets.symmetric(horizontal: 20.0),
              childrenPadding: const EdgeInsets.only(top: 5.0, left: 35.0, right: 35.0, bottom: 20.0),
              title: Text(task.title, style: TextStyle(fontSize: 20.0 * textScaleFactor, fontWeight: FontWeight.w600, decoration: task.isDone ? TextDecoration.lineThrough : null)),
              leading: Checkbox(
                onChanged: (newValue) {
                  taskData.updateTask(task);
                },
                value: task.isDone,
                activeColor: const Color(0xFF3FBAC2),

              ),
              trailing: IconButton(
                onPressed: () {
                  taskData.deleteTask(task);
                },
                icon: const Icon(Icons.delete_forever, color: Color(0xFF8B0000)),
              ),
              shape: Border.all(color: Colors.transparent),
              children: [
                Text(task.description, style: TextStyle(fontSize: 20.0 * textScaleFactor)),
              ],
            ),
          );
        },
        itemCount: taskData.taskSize,
      ),
    );
  }
}
