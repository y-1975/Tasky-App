import 'package:tasky/Models/task_model.dart';

class UserModel {
  final String userName;
  final String? motivationQuote;
  bool isLogin = false;
  List<TaskModel> userTasks = [];
  List<TaskModel> userDoneTasks = [];

  UserModel({required this.userName, this.motivationQuote});

  void addTask(TaskModel newTask) {
    userTasks.add(newTask);
  }

  void removeTask(TaskModel newTask) {
    userTasks.remove(newTask);
  }

  void doneTask(TaskModel newTask) {
    newTask.doneTask();
    userDoneTasks.add(newTask);
  }
}
