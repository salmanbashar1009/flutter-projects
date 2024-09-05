import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/styles/styles.dart';
import 'package:flutter_task_manager_app/ui/screens/splash_screen.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TaskManagerApp());
}

class TaskManagerApp extends StatefulWidget {
  const TaskManagerApp({Key? key}) : super(key: key);
  static GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();


  @override
  State<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      key: TaskManagerApp.globalKey,
      title: "Flutter Task Manager",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
          primarySwatch: Colors.green,
          textTheme: const TextTheme(
              titleLarge: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: colorDarkBlue,
                  letterSpacing: 0.6),
              titleMedium: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: colorDarkBlue,
                  letterSpacing: 0.6),
              titleSmall: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: colorDarkBlue,
                  letterSpacing: 0.6)),
          inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: colorWhite,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: OutlineInputBorder(borderSide: BorderSide.none)),
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: colorGreen
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  backgroundColor: colorGreen,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))))),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.indigo,
          textTheme: const TextTheme(
              titleLarge: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: colorDarkBlue,
                  letterSpacing: 0.6),
              titleMedium: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: colorDarkBlue,
                  letterSpacing: 0.6),
              titleSmall: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: colorDarkBlue,
                  letterSpacing: 0.6)),
          inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: colorWhite,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              border: OutlineInputBorder(borderSide: BorderSide.none)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 80),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))))),
      themeMode: ThemeMode.light,
      home:  const SplashScreen(),
    );
  }
}
