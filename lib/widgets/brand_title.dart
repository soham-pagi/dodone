import 'package:flutter/material.dart';
import 'package:dodone/models/task_data.dart';
import 'package:provider/provider.dart';

class BrandTitle extends StatelessWidget {
  final String _brandTitle = 'DoDone';

  const BrandTitle({super.key});

  @override
  Widget build(BuildContext context) {
    int remainingTasks = Provider.of<TaskData>(context).remainingTasks;

    return Baseline(
      baseline: 60,
      baselineType: TextBaseline.alphabetic,
      child: Container(
        padding: const EdgeInsets.only(left: 25.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_brandTitle,
                textScaleFactor: 0.85,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 60.0)),
            const SizedBox(height: 10.0),
            Text(
              '    ${remainingTasks == 0 ? 'All Done!' : '$remainingTasks ${remainingTasks <= 1 ? 'Task' : 'Tasks'} remaining'}',
              textAlign: TextAlign.left,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
