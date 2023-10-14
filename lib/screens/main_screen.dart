import 'package:flutter/material.dart';
import 'package:my_todo/models/task_data.dart';
import 'package:provider/provider.dart';
import '../widgets/task_list.dart';
import '../widgets/brand_title.dart';
import '../widgets/add_or_update_task.dart';
import 'package:my_todo/utils/dialog_utils.dart';
import 'package:my_todo/constants.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          actions: [
            PopupMenuButton(
              shape: kRoundBorderShape,
              color: kSecondaryColor,
              icon: const Icon(Icons.more_vert_rounded, color: Colors.white,),
              itemBuilder: (context) => [
                PopupMenuItem(
                  onTap: () => showHelpDialog(context: context),
                  child: const Text('Help', style: kDefaultFontStyle,)
                ),
                PopupMenuItem(
                  onTap: () => showAppAboutDialog(context: context),
                  child: const Text('About', style: kDefaultFontStyle,)
                ),
                PopupMenuItem(
                  child: const Text('Erase all', style: TextStyle(fontSize: 20.0, color: kRedColor),),
                  onTap: () {
                    try {
                      showAlertDialog(
                        context: context,
                        title: 'Are you sure?',
                        description: 'This will delete all the tasks!',
                        yesMsg: 'All tasks cleared',
                        yesAction: context.read<TaskData>().deleteAllTasks
                      );
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
