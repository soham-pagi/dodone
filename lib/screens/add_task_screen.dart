import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_todo/models/task_data.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          Text('Add New Task', textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 35.0, fontWeight: FontWeight.w600)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: TextField(
              controller: _titleController,
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              style: const TextStyle(fontSize: 20.0),
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
              style: const TextStyle(fontSize: 20.0),
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
                  fontSize: 20.0,
                );

                return;
              }

              context.read<TaskData>().createTask(title, description);
              Navigator.pop(context);
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>(Size(MediaQuery.of(context).size.width - 40, 50)),
              backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
            ),
            child: const Text('Add', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500)),
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
