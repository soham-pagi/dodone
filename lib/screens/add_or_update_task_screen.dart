import 'package:flutter/material.dart';
import 'package:my_todo/models/task.dart';
import 'package:provider/provider.dart';
import 'package:my_todo/models/task_data.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddOrUpdateTaskScreen extends StatefulWidget {
  final bool addScreen;
  final Task? task;
  final String title;
  final String description;

  const AddOrUpdateTaskScreen({super.key, this.addScreen = true, this.title = '', this.description = '', this.task});

  @override
  State<AddOrUpdateTaskScreen> createState() => _AddOrUpdateTaskScreenState();
}

class _AddOrUpdateTaskScreenState extends State<AddOrUpdateTaskScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final bool _addScreen;
  late final Task? _task;

  @override
  void initState() {
    super.initState();

    _task = widget.task;
    _addScreen = widget.addScreen;
    _titleController = TextEditingController(text: widget.title);
    _descriptionController = TextEditingController(text: widget.description);
  }

  @override
  Widget build(BuildContext context) {
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      padding: EdgeInsets.only(top: 30.0, bottom: MediaQuery.of(context).viewInsets.bottom + 40),
      decoration: const BoxDecoration(
        color: Color(0xFFD3D4D8),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(_addScreen ? 'New Task' : 'Update Task', textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 35.0 * textScaleFactor, fontWeight: FontWeight.w600)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: TextField(
              controller: _titleController,
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              style: TextStyle(fontSize: 20.0 * textScaleFactor),
              cursorColor: const Color(0xFF00ADB5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 40.0),
            child: TextField(
              controller: _descriptionController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              style: TextStyle(fontSize: 20.0 * textScaleFactor),
              cursorColor: const Color(0xFF00ADB5),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String title = _titleController.text.trim();
              String description = _descriptionController.text.trim();
              if (title.isEmpty) {
                Fluttertoast.showToast(
                  msg: "Please enter the title",
                  gravity: ToastGravity.BOTTOM,
                  textColor: Colors.white,
                  backgroundColor:  Colors.grey,
                  fontSize: 20.0 * textScaleFactor,
                );

                return;
              }

              if (_addScreen) {
                context.read<TaskData>().createTask(title, description);
              } else {
                context.read<TaskData>().editTask(_task, title, description);
              }

              Navigator.pop(context);
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>(Size(MediaQuery.of(context).size.width - 40, 50)),
              backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
            ),
            child: Text(_addScreen ? 'Add' : 'Update', style: TextStyle(fontSize: 25.0 * textScaleFactor, fontWeight: FontWeight.w500)),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
