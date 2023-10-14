import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_todo/constants.dart';
import 'package:package_info_plus/package_info_plus.dart';

void showMessage({required String msg}) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.BOTTOM,
    textColor: Colors.white,
    backgroundColor:  Colors.grey,
    fontSize: 18.0,
  );
}

void showHelpDialog({required BuildContext context}) {
  final List<Map<String, String>> instructions = [
    {'text': 'Add Task: ', 'description': 'Tap "+" to add a task.'},
    {'text': 'Edit Task: ', 'description': 'Hold on title edit existing task.'},
    {'text': 'View: ', 'description': 'Tap title to view description.'},
    {'text': 'Copy: ', 'description': 'Double-tap to copy text.'},
    {'text': 'Mark: ', 'description': 'Check 🔲 to mark done.'},
    {'text': 'Delete: ', 'description': 'Tap ❌ to delete.'},
    // {'text': 'Erase all: ', 'description': 'Menu > Erase all, to delete all tasks.'},
  ];

  List<Widget> textWidgets = [
    const SizedBox(height: 15.0,)
  ];

  for (var instruction in instructions) {
    var instructionText = instruction['text'];
    var instructionDescription = instruction['description'];

    var textWidget = Text.rich(
      TextSpan(
        children: [
          TextSpan(text: instructionText, style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700)),
          TextSpan(text: instructionDescription, style: const TextStyle(fontSize: 20.0)),
        ],
      ),
    );

    textWidgets.add(textWidget);
    textWidgets.add(const SizedBox(height: 20.0));
  }

  textWidgets.isNotEmpty ? textWidgets.removeLast() : null;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: EdgeInsets.zero,
        shape: kRoundBorderShape,
        backgroundColor: kSecondaryColor,
        title: const Text('Quick Start Guide', textAlign: TextAlign.center, style: kDialogTitleStyle,),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: textWidgets
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              style: kDialogButtonStyle,
              child: const Text("Done", style: kDefaultDialogButtonStyle),
          ),
        ],
      );
    }
  );
}

void showAlertDialog({required BuildContext context, required String title, String description = '', VoidCallback? yesAction, required String yesMsg}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: kSecondaryColor,
        shape: kRoundBorderShape,
        title: Text(title, style: kDialogTitleStyle),
        content: Text(description, style: kDefaultFontStyle),
        actions: [
          TextButton(
            onPressed: () {
              if (yesAction != null) {
                yesAction();
              }
              Navigator.pop(context);
              showMessage(msg: yesMsg);
            },
            style: kDialogDangerButtonStyle,
            child: const Text("Yes", style: TextStyle(fontSize: 20.0, color: kRedColor))
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: kDialogButtonStyle,
            child: const Text("No", style: TextStyle(fontSize: 20.0, color: kPrimaryColor))
          ),
        ],
      );
    },
  );
}

void showAppAboutDialog({required BuildContext context}) {
  PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          shape: kRoundBorderShape,
          backgroundColor: kSecondaryColor,
          title: Row(children: [
            Image.asset('images/logo.png'),
            Text(appName, style: const TextStyle(fontSize: 24.0),)
          ],),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('package name: $packageName', style: kDefaultFontStyle,),
              Text('version: $version', style: kDefaultFontStyle),
              Text('build number: $buildNumber', style: kDefaultFontStyle)
            ],
          ),
          actions: [
            TextButton(onPressed: () => showLicensePage(context: context), style: kDialogButtonStyle, child: const Text('View Licences', style: kPrimaryFontStyle,)),
            TextButton(onPressed: () => Navigator.pop(context), style: kDialogButtonStyle, child: const Text('Close', style: kPrimaryFontStyle))
          ],
        );
      }
    );

  });
}

