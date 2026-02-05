class TaskModel {
  final String taskName;
  final String? taskDesc;
  bool isDone = false;
  bool isHighPriority = false;

  TaskModel({ required this.taskName, this.taskDesc});

  void setHighPriority() {
    isHighPriority =  !isHighPriority;
  }

  void doneTask() {
    isDone =  !isDone;
  }
}
