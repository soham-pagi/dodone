import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'screens/main_screen.dart';
import 'models/task_data.dart';
import 'services/notification_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().init();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFFD3D4D8), // navigation bar color
    // statusBarColor: Colors.transparent // status bar color
  ));

  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskData(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: MediaQuery.of(context).textScaleFactor.clamp(0.85, 0.95)),
          child: const DoDone(),
        );
      }
    ),
  );
}

class DoDone extends StatelessWidget {
  const DoDone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(cursorColor: Color(0xFF00ADB5), selectionColor: Color(0xFF3FBAC2), selectionHandleColor: Color(0xFF3FBAC2)),
          primaryColor: const Color(0xFF3FBAC2),
          scaffoldBackgroundColor: const Color(0xFF3FBAC2),
          colorScheme: ColorScheme.fromSwatch(accentColor: const Color(0xFF3FBAC2)),
          fontFamily: 'Comfortaa',
          inputDecorationTheme: const InputDecorationTheme(
            floatingLabelStyle: TextStyle(color: Color(0xFF00ADB5)),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF11BFAE), width: 1.0)),// Change the border color when focused
          ),
        ),
        // home: const SafeArea(child: MainScreen())
        home: const SafeArea(child: MainScreen())
    );
  }
}
