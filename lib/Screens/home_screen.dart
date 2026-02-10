import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/Models/task_model.dart';
import 'package:tasky/Models/user_model.dart';
import 'package:tasky/Screens/add_new_task_screen.dart';
import 'package:tasky/core/Style/app_colors.dart';
import 'package:tasky/core/Style/app_fonts.dart';
import 'package:tasky/core/Style/app_styles.dart';
import 'package:tasky/core/Widgets/button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Map<String, dynamic> userTask = {};
String? userName = "";
final UserModel user = UserModel(userName: userName ?? '');

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _loadUserName();
    _loadUserTasks();
  }

  void _loadUserName() async {
    final pref = await SharedPreferences.getInstance();
    userName = pref.getString('userName');
    setState(() {});
  }

  void _loadUserTasks() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.getString('userTasks') != null) {
      final tasksJson =
          jsonDecode(pref.getString('userTasks') ?? '') as List<dynamic>;
      final tasks = tasksJson.map((element) {
        return TaskModel(
          taskName: element['taskName'],
          taskDesc: element['taskDecs'],
          isHighPriority: element['isHP'],
        );
      }).toList();
      user.userTasks = tasks;
    }
    setState(() {});
  }

  // int containerHight() {
  //   int isHPCounter = 0;
  //   for (int i = 0; i < user.userTasks.length; i++) {
  //     if (user.userTasks[i].isHighPriority == true) isHPCounter++;
  //   }
  //   isHPCounter = 75 + (isHPCounter * 32);
  //   return isHPCounter;
  // }

  List<TaskModel?> hPTasks() {
    List<TaskModel?> hpTAsks = user.userTasks.map((element) {
      if (element.isHighPriority == true) {
        return TaskModel(
          taskName: element.taskName,
          taskDesc: element.taskDesc,
          isHighPriority: element.isHighPriority,
        );
      }
    }).toList();

    return hpTAsks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ButtonWidget(
        lable: 'Add New Task',
        icon: Icons.add,
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return AddNewTaskScreen();
              },
            ),
          );
        },
        buttomWidth: 167.w,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.only(left: 16.w, right: 16.w, top: 60.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/me.jpg',
                      width: 42.w,
                      height: 42.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Evening , $userName',
                        style: AppTextStyles.headLine.copyWith(
                          fontSize: 16.sp,
                          fontFamily: AppFonts.mainFont,
                        ),
                      ),
                      Text(
                        'One task at a time.One step \ncloser.',
                        style: TextStyle(
                          fontFamily: AppFonts.mainFont,
                          fontSize: 14.sp,
                          color: AppColors.greyC6C,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.black282,
                      shape: CircleBorder(),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/sun.svg',
                      width: 18.w,
                      height: 18.h,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                'Yuhuu ,Your work Is ',
                style: AppTextStyles.headLine.copyWith(fontSize: 32.sp),
              ),
              Row(
                children: [
                  Text(
                    'almost done ! ',
                    style: AppTextStyles.headLine.copyWith(fontSize: 32.sp),
                  ),
                  SvgPicture.asset(
                    'assets/icons/waving-hand.svg',
                    width: 32.w,
                    height: 32.h,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Container(
                height: 72.h,
                width: 343.w,
                decoration: BoxDecoration(
                  color: AppColors.black282,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Achieved Tasks',
                            style: TextStyle(
                              fontFamily: AppFonts.mainFont,
                              color: AppColors.whiteFFF,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            '3 Out of 6 Done',
                            style: TextStyle(
                              fontFamily: AppFonts.mainFont,
                              fontSize: 14.sp,
                              color: AppColors.greyC6C,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  //Progress Persentage Ex: 50%
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                height: 176.h,
                width: 343.w,
                decoration: BoxDecoration(
                  color: AppColors.black282,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'High Priority Tasks',
                        style: TextStyle(
                          fontFamily: AppFonts.mainFont,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.green15B,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      SizedBox(
                        height: 100,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            Text(
                              '',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColors.whiteFFF,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'Flutter Local Storage',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.whiteFFF,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
