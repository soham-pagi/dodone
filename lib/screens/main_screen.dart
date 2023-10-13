import 'package:flutter/material.dart';
import 'package:my_todo/models/task_data.dart';
import 'package:provider/provider.dart';
import '../widgets/task_list.dart';
import '../widgets/brand_title.dart';
import '../widgets/add_or_update_task.dart';
import 'package:my_todo/utils/utils.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            PopupMenuButton(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              color: const Color(0xFFD3D4D8),
              icon: const Icon(Icons.more_vert_rounded, color: Colors.white,),
              itemBuilder: (context) => [
                PopupMenuItem(
                  onTap: () => print('Tapp'),
                  child: const Text('Help')
                ),
                PopupMenuItem(
                  onTap: () => print('About'),
                  child: const Text('About')
                ),
                PopupMenuItem(
                  child: const Text('Clear all'),
                  onTap: () {
                    try {
                      context.read<TaskData>().deleteAllTasks();
                      showMessage(msg: 'Delete successfully');
                    } catch (e) {
                      showMessage(msg: 'Failed to delete');
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
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
          BrandTitle(),
          TaskScreen(),
        ],
      ),
    );
  }
}
