import 'package:flutter/material.dart';
import 'package:my_todo/models/task_data.dart';
import 'package:provider/provider.dart';

class BrandTitle extends StatelessWidget {
  const BrandTitle({super.key});

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    // double fontSize = screenSize * 0.13;
    // double containerHeight = screenSize * 0.35;

    int remainingTasks = Provider.of<TaskData>(context).remainingTasks;

    return Container(
      // height: containerHeight,
      height: 180.0,
      padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
      child: FittedBox(
        fit: BoxFit.none,
        alignment: Alignment.bottomLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("DoDone", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 60.0)),
            const SizedBox(height: 10.0),
            Text(
              '   ${remainingTasks == 0 ? 'All Done!' : '$remainingTasks ${remainingTasks <= 1 ? 'Task' : 'Tasks'} remaining'}',
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
