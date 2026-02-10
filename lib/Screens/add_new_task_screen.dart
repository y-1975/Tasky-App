import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/Models/task_model.dart';
import 'package:tasky/Models/user_model.dart';
import 'package:tasky/Screens/home_screen.dart';
import 'package:tasky/core/Style/app_colors.dart';
import 'package:tasky/core/Style/app_styles.dart';
import 'package:tasky/core/Widgets/button_widget.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController taskDescController = TextEditingController();
  final TextEditingController taskNameController = TextEditingController();

  //TODO: Dispise this Controllers
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isHP = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ButtonWidget(
        lable: ' Add Task',
        icon: Icons.add,
        onPress: () async {
          if (_key.currentState?.validate() ?? false) {
            TaskModel task = TaskModel(
              taskName: taskNameController.text,
              taskDesc: taskDescController.text,
              isHighPriority: isHP,
            );
            final pref = await SharedPreferences.getInstance();
            final UserModel user = UserModel(
              userName: pref.getString('userName') ?? ' ',
            );

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
            user.addTask(task);
            final String tasksAfterEncode = jsonEncode(user.userTasks);
            pref.setString('userTasks', tasksAfterEncode);
            final tasksFromLocalStorage = pref.getString('userTasks');
            print('Tasks From Local Storaeg $tasksFromLocalStorage');
            
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return HomeScreen();
                },
              ),
            );
          }
        },
        buttomWidth: 343.w,
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.whiteFFF),
        backgroundColor: AppColors.black181,
        centerTitle: false,
        title: Text(
          'New Task',
          style: TextStyle(
            color: AppColors.whiteFFF,
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              SizedBox(height: 18.h),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Task Name',
                        style: TextStyle(
                          color: AppColors.whiteFFF,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      TextFormField(
                        controller: taskNameController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please Enter The Task Name ";
                          }
                          return null;
                        },
                        style: TextStyle(color: AppColors.whiteFFF),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(13.r),
                          hintText: 'Finish UI design for login screen',
                          hintStyle: AppTextStyles.hintTextStyle,
                          filled: true,
                          fillColor: AppColors.black282,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Task Description',
                        style: TextStyle(
                          color: AppColors.whiteFFF,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      TextFormField(
                        controller: taskDescController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please Enter The Task Description ";
                          }
                          return null;
                        },
                        maxLines: 6,
                        style: TextStyle(color: AppColors.whiteFFF),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(18.r),
                          hintText:
                              'Finish onboarding UI and hand off to devs by Thursday.',
                          hintStyle: AppTextStyles.hintTextStyle,
                          filled: true,
                          fillColor: AppColors.black282,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'High Priority',
                            style: TextStyle(
                              color: AppColors.whiteFFF,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Switch(
                            activeThumbColor: AppColors.whiteFFF,
                            inactiveThumbColor: AppColors.whiteFFF,
                            inactiveTrackColor: AppColors.black282,
                            activeTrackColor: AppColors.green15B,
                            value: isHP,
                            onChanged: (value) {
                              isHP = value;
                              setState(() {});
                            },
                          ),
                        ],
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
