import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/Screens/add_new_task_screen.dart';
import 'package:tasky/Screens/home_screen.dart';
import 'package:tasky/Screens/welcome_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/Style/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  String? username = pref.getString('userName');

  //   print("user name : $username");

  runApp(MyApp(username: username));
}

class MyApp extends StatelessWidget {
  final String? username;
  const MyApp({super.key, this.username});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(365, 809),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(title: 'Tasky', theme: AppThemes.dark, home: child);
      },
      child: (username == null) ? const WelcomeScreen() : const HomeScreen(),
      //AddNewTaskScreen()
    );
  }
}
