class TaskModel {
  static const String taskNameKey = "taskName";
  static const String taskDescKey = "taskDecs";
  static const String isHPKey = "isHP";

  final String taskName;
  final String taskDesc;
  final bool isHighPriority;
  bool isDone = false;

  TaskModel({
    required this.taskName,
    required this.taskDesc,
    required this.isHighPriority,
  });

  Map<String, dynamic> toJson() {
    return {
      taskNameKey : taskName,
      taskDescKey : taskDesc,
      isHPKey : isHighPriority,
    };
  }

  // void setHighPriority(bool value) {
  //   isHighPriority = value;
  // }

  // void doneTask() {
  //   isDone = !isDone;
  // }
}
