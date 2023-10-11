import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _notificationService = NotificationService._internal();
  late final NotificationDetails _platformSpecific;

  NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  FlutterLocalNotificationsPlugin fln = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    var initializationSettings = const InitializationSettings(
        android: AndroidInitializationSettings('ic_launcher')
    );

    await fln.initialize(initializationSettings);

    var android = const AndroidNotificationDetails(
        'task_updates',
        'Task Updates',
        channelDescription: 'Get Task Updates',
        importance: Importance.max,
        priority: Priority.max
    );

    _platformSpecific = NotificationDetails(android: android);
  }

  Future<void> scheduleNotification(int remainingTasks) async {
    // print('Remaining task -======================================= $remainingTasks');
    int id = 0;
    String title = '', message = '';
    if (remainingTasks == 0) {
      title = 'No Tasks Remaining';
      message = 'You have completed all your tasks. Great job! Consider adding more tasks to stay productive.';
    } else if (remainingTasks <= 2) {
      title = '$remainingTasks ${remainingTasks == 1 ? 'Task' : 'Tasks'} Remaining';
      message = 'You have $remainingTasks ${remainingTasks == 1 ? 'task' : 'tasks'} left to complete. Keep it up!';
    } else {
      title = 'Urgent: $remainingTasks Tasks Remaining!';
      message = 'Take your time to work on them steadily and make progress at your own pace!';
    }

    await fln.periodicallyShow(id, title, message, RepeatInterval.hourly, _platformSpecific);
    // await fln.show(id, title, message, _platformSpecific);
  }
}