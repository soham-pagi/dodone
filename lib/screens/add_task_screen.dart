import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_todo/models/task_data.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String newTitle = '';

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 40.0, bottom: MediaQuery.of(context).viewInsets.bottom + 50),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Add New Task', textAlign: TextAlign.center, style: TextStyle(color: Colors.lightBlueAccent, fontSize: 35.0, fontWeight: FontWeight.w500)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
              child: TextField(
                autofocus: true,
                onChanged: (newValue) {
                  newTitle = newValue;
                },
                textAlign: TextAlign.center,
                decoration: const InputDecoration(hintText: 'Title'),
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (newTitle == '') {
                  Fluttertoast.showToast(
                    msg: "Please enter the title",
                    gravity: ToastGravity.BOTTOM,
                    textColor: Colors.white,
                    backgroundColor: Colors.lightBlueAccent,
                    fontSize: 20.0
                  );

                  return;
                }

                context.read<TaskData>().createTask(newTitle);
                newTitle = '';
                Navigator.pop(context);
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(const Size(480, 50)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
              ),
              child: const Text('Add', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500)),
            )
          ],
        ),
      ),
    );
  }
}
