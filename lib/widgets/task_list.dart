import 'package:flutter/material.dart';
import 'package:my_todo/constants.dart';
import 'package:my_todo/models/task_data.dart';
import 'package:provider/provider.dart';
import 'add_or_update_task.dart';
import 'package:flutter/services.dart';
import 'package:my_todo/utils/dialog_utils.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var taskData = Provider.of<TaskData>(context);

    return  Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFD3D4D8), // light grey
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))
        ),
        child: taskData.taskSize > 0 ? ListView.builder(
          padding: const EdgeInsets.only(top: 20.0),
          itemBuilder: (BuildContext context, int index) {
            final task = taskData.allTasks[index];

            return GestureDetector(
              onDoubleTap: () async {
                await Clipboard.setData(ClipboardData(text: task.title));
                showMessage(msg: 'Title copied to clipboard');
              },
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
                shape: Border.all(color: Colors.transparent),
                key: Key(index.toString()),
                expandedAlignment: Alignment.centerLeft,
                tilePadding: const EdgeInsets.symmetric(horizontal: 20.0),
                childrenPadding: const EdgeInsets.only(top: 5.0, left: 35.0, right: 35.0, bottom: 20.0),
                textColor: const Color(0xFF00ADB5),

                leading: Checkbox(
                  onChanged: (newValue) => taskData.updateTask(task),
                  value: task.isDone,
                ),
                title: Text(task.title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, decoration: task.isDone ? TextDecoration.lineThrough : null)),
                trailing: IconButton(
                  onPressed: () => context.read<TaskData>().deleteTask(task),
                  icon: const Icon(Icons.close, color: Colors.red,),
                ),
                children: [
                  GestureDetector(
                    onDoubleTap: () async {
                      await Clipboard.setData(ClipboardData(text: task.description));
                      showMessage(msg: 'Description copied to clipboard');
                    },
                    child: Text(task.description, style: const TextStyle(fontSize: 20.0))
                  ),
                ],
              ),
            );
          },
          itemCount: taskData.taskSize,
        )
        :
        const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.create_sharp, size: 26.0, color: Colors.black38),
              SizedBox(width: 10.0),
              Text('Add a task  ', style: kDefaultFontStyle)
            ],
          ),
        ),
      ),
    );
  }
}
