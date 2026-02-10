import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/Models/task_model.dart';

class UserModel {
  static const String userNameKey = 'userName';
  static const String userMQKey = 'userMQ';
  static const String isLoginKey = 'isLogin';
  static const String userTasksKey = 'userTasks';
  static const String userDoneTasksKey = 'userDoneTasks';
  final String userName;
  final String? motivationQuote;
  bool isLogin = false;
  List<TaskModel> userTasks = [];
  List<TaskModel> userDoneTasks = [];

  UserModel({required this.userName, this.motivationQuote});

  void loadUserTasks() async {
    final pref = await SharedPreferences.getInstance();
    final stordTasks = pref.getString('userTasks');
    final stordTasksList = jsonDecode(stordTasks ?? " ");
    userTasks = stordTasksList;
  }

  Map<String, dynamic> toJson() {
    return {
      userNameKey: userName,
      userMQKey: motivationQuote,
      isLoginKey: isLogin,
      userTasksKey: userTasks,
      userDoneTasksKey: userDoneTasks,
    };
  }

  void addTask(TaskModel newTask) {
    userTasks.add(newTask);
  }

  void removeTask(TaskModel newTask) {
    userTasks.remove(newTask);
  }
}
