import 'package:flutter/material.dart';
import 'package:my_todo/models/task_data.dart';
import 'package:provider/provider.dart';

class BrandTitle extends StatelessWidget {
  final String _brandTitle = 'DoDone';

  const BrandTitle({super.key});


  @override
  Widget build(BuildContext context) {
    int remainingTasks = Provider.of<TaskData>(context).remainingTasks;
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      height: 180.0,
      padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_brandTitle, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 60.0)),
          const SizedBox(height: 10.0),
          Text(
            '   ${remainingTasks == 0 ? 'All Done!' : '$remainingTasks ${remainingTasks <= 1 ? 'Task' : 'Tasks'} remaining'}',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20.0 * textScaleFactor ),
          ),
        ],
      ),
    );
  }
}
