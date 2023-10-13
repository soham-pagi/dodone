import 'package:flutter/material.dart';
import 'task_screen.dart';
import 'brand_title.dart';
import 'add_or_update_task_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) {
              return const AddOrUpdateTaskScreen();
            }
          );
        },
        child: const Icon(Icons.add, color: Color(0xFFD3D4D8)),
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
