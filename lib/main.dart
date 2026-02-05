import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/Screens/welcome_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/Style/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  String? username = pref.getString('username');
  print('user name = ${username}');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      child: const WelcomeScreen(),
    );
  }
}
