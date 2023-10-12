import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _notificationService = NotificationService._internal();
  late final FlutterLocalNotificationsPlugin _fln;
  late final NotificationDetails _platformSpecific;

  NotificationService._internal() {
    var android = const AndroidNotificationDetails(
        'task_updates',
        'Task Updates',
        channelDescription: 'Get Task Updates',
        importance: Importance.max,
        priority: Priority.max
    );

    _platformSpecific = NotificationDetails(android: android);
    _fln = FlutterLocalNotificationsPlugin();
  }

  factory NotificationService() {
    return _notificationService;
  }

  Future<void> init() async {
    var initializationSettings = const InitializationSettings(
      android: AndroidInitializationSettings('ic_launcher'),
    );

    await _fln.initialize(initializationSettings);
  }

  Future<void> scheduleNotification(int remainingTasks) async {
    int id = 0;
    String title = '', message = '';
    if (remainingTasks == -1) {
      title =  '🎉 Welcome to DoDone! 🎉';
      message = "Get started by adding your first task! 🚀 To add a task, tap the '+' button and fill in the details. Stay organized and accomplish your goals effortlessly.";
    }
    else if (remainingTasks == 0) {
      title = 'No Tasks Remaining';
      message = 'You have completed all your tasks. Great job! Consider adding more tasks to stay productive.';
    } else if (remainingTasks <= 2) {
      title = '$remainingTasks ${remainingTasks == 1 ? 'Task' : 'Tasks'} Remaining';
      message = 'You have $remainingTasks ${remainingTasks == 1 ? 'task' : 'tasks'} left to complete. Keep it up!';
    } else {
      title = 'Urgent: $remainingTasks Tasks Remaining!';
      message = 'Take your time to work on them steadily and make progress at your own pace!';
    }

    await _fln.periodicallyShow(id, title, message, RepeatInterval.daily, _platformSpecific);
    // await fln.show(id, title, message, _platformSpecific);
  }
}