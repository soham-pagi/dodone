import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'screens/main_screen.dart';
import 'models/task_data.dart';
import 'services/notification_service.dart';
import 'constants.dart';

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
            data: MediaQuery.of(context).copyWith(
                textScaleFactor:
                    MediaQuery.of(context).textScaleFactor.clamp(0.85, 0.95)),
            child: const DoDone(),
          );
        }),
  );
}

class DoDone extends StatelessWidget {
  const DoDone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: kPrimaryColor,
            elevation: 0,
          ),
          cardColor: kSecondaryColor,
          textSelectionTheme: const TextSelectionThemeData(
              cursorColor: kPrimaryColor,
              selectionColor: kPrimaryColor,
              selectionHandleColor: kPrimaryColor),
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kPrimaryColor,
          colorScheme: ColorScheme.fromSwatch(accentColor: kPrimaryColor),
          fontFamily: 'Comfortaa',
          inputDecorationTheme: const InputDecorationTheme(
            floatingLabelStyle: TextStyle(color: kPrimaryColor),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: kBorderSideColor,
                    width: 1.0)), // Change the border color when focused
          ),
        ),
        // home: const SafeArea(child: MainScreen())
        home: const SafeArea(child: MainScreen()));
  }
}
