import 'package:flutter/material.dart';
import 'task_screen.dart';
import 'brand_title.dart';
import 'add_task_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF3FBAC2),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) {
              return const AddTaskScreen();
            }
          );
        },
        backgroundColor: const Color(0xFF3FBAC2),
        child: const Icon(Icons.add),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // BrandTitle(),
          BrandTitle(),
          Expanded(child: TaskScreen()),
          // Expanded(flex: 1, child: BrandTitle()),
          // Expanded(flex: 5, child: TaskScreen()),
        ],
      ),
    );
  }
}
