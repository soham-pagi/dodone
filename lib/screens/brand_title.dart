import 'package:flutter/material.dart';
import 'package:my_todo/models/task_data.dart';
import 'package:provider/provider.dart';

class BrandTitle extends StatelessWidget {
  const BrandTitle({super.key});

  @override
  Widget build(BuildContext context) {
    int remainingTasks = Provider.of<TaskData>(context).remainingTasks;

    return Flexible(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.only(left: 25.0, bottom: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("DoDone", style: TextStyle(color: Colors.white, fontFamily: 'SnapITC', fontSize: 60.0)),
            const SizedBox(height: 20.0),
            Text('   $remainingTasks ${remainingTasks <= 1 ? 'Task' : 'Tasks'} remaining', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18.0)),
          ],
        ),
      ),
    );
  }
}
